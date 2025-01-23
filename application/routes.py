from application import app
from application import db
from flask import render_template, request, flash, redirect, url_for, session, jsonify
from application.forms import LoginForm, SignupForm
from application.models import Login
from flask_login import LoginManager, login_required, login_user, current_user, logout_user
from werkzeug.security import check_password_hash, generate_password_hash
from flask_cors import CORS, cross_origin
from tensorflow.keras.preprocessing import image
import traceback
from PIL import Image, ImageOps
import numpy as np
import tensorflow.keras.models
import re
import base64
from io import BytesIO
import io
# from tensorflow.keras.datasets.mnist import load_data
import json
import numpy as np
import requests
import pathlib, os

#Server URL – change xyz to Practical 7 deployed URL [TAKE NOTE]
url_gen = 'https://gan-gen-ca2.onrender.com/v1/models/generator:predict'

# Path to store generated images
IMAGE_DIR = 'static/images/gan_images/'

# Ensure the directory exists
if not os.path.exists(IMAGE_DIR):
    os.makedirs(IMAGE_DIR)

# runs every time render_template is called
@app.context_processor
def inject_user_logged_in():
    # Get the user_logged_in value and username from the session
    user_logged_in = session.get('user_logged_in', False)
    username = session.get('username', None) if user_logged_in else None
    return {
        'user_logged_in': user_logged_in,
        'username': username
    }

#Handles http://127.0.0.1:5000/
@app.route('/')
@app.route('/index')
@app.route('/home')
def home():
    # Get the user_logged_in value from the session
    user_logged_in = session.get('user_logged_in', False)
    return render_template("index.html", user_logged_in=user_logged_in)  # Use a template for your main page


# Login
login_manager = LoginManager(app)
login_manager.login_view = 'login'  # Redirect to 'login' route if not logged in
login_manager.login_message = "Please log in to access this page."

@login_manager.user_loader
def load_user(user_id):
    return Login.query.get(int(user_id))

# Handle http://127.0.0.1:5000/login
@app.route('/login', methods=['GET', 'POST'])
def login():
    login_form = LoginForm()

    if request.method == 'POST' and login_form.validate_on_submit():
        username = login_form.username.data
        email = login_form.email.data
        password = login_form.password.data

        # Find the user by username or email
        user = Login.query.filter_by(username=username, email=email).first()

        if user and check_password_hash(user.password_hash, password):
            login_user(user)  # Use Flask-Login to handle user session

            # After login, store user id and update session
            session['user_id'] = user.id  # Store user ID in session
            session['username'] = user.username  # Store username (optional)
            session['user_logged_in'] = True  # Update session to indicate user is logged in

            flash('Login successful!', 'success')
            return redirect(url_for('home'))
        else:
            flash('Invalid credentials. Please check your username, email, and password.', 'danger')

    return render_template('login.html', login_form=login_form)

# Handle http://127.0.0.1:5000/signup
@app.route('/signup', methods=['GET', 'POST'])
def signup():
    signup_form = SignupForm()

    # Check if signup form was submitted
    if signup_form.validate_on_submit():
        username = signup_form.username.data
        email = signup_form.email.data
        password = signup_form.password.data

        # Check if the email is already taken
        if Login.query.filter_by(email=email).first():
            flash('Email is already in use. Please log in instead.', 'danger')
        else:
            hashed_password = generate_password_hash(password, method='pbkdf2:sha256')
            new_user = Login(username=username, email=email, password_hash=hashed_password)
            db.session.add(new_user)
            db.session.commit()
            flash('Signup successful! You can now log in.', 'success')
            return redirect(url_for('home'))  # Redirect to the login page

    return render_template('signup.html', signup_form=signup_form)

# Handle http://127.0.0.1:5000/logout
@app.route('/logout')
def logout():
    logout_user()  # Use Flask-Login's logout_user function to clear the session
    session.pop('user_id', None)  # Explicitly clear user session data
    session.pop('username', None)  # Clear username if it's stored in session
    session.pop('user_logged_in', None)  # Clear the user_logged_in flag from session
    flash('You have been logged out.', 'info')
    return redirect(url_for('home'))

# Handle http://127.0.0.1:5000/predict
@app.route("/predict", methods=['GET', 'POST'])
@cross_origin(origin='localhost',headers=['Content-Type','Authorization'])
def predict():
    img_base64 = None  # Variable to store generated image (base64 string)
    
    if request.method == 'POST':
        # Retrieve the class label input from the form
        class_label = request.form.get('class_label')
        
        if class_label and len(class_label) == 1 and class_label.isalpha():
            img_base64 = generate_image_from_class(class_label)
        else:
            flash('Please enter a valid class label (single letter A-Z)', 'danger')

    return render_template('predict.html', img_base64=img_base64)

def generate_image_from_class(class_label):
    try:
        # Convert class label (e.g., "S") to an integer index (A=0, ..., Z=25)
        class_index = ord(class_label.lower()) - ord('a')

        # Generate a 100-dimensional latent vector with random floats
        latent_vector = np.random.rand(100).astype(np.float32)  # Shape should be (1, 100)
        
        # Construct the one-hot encoded vector for the class
        one_hot_encoded_class = np.array([1.0 if i == class_index else 0.0 for i in range(26)], dtype=np.float32)  # Shape should be (1, 26)

        # Prepare the payload as a dictionary (numpy arrays should be converted to lists)
        instances = [{
            "input_3": one_hot_encoded_class.astype(np.float32).tolist(),
            "input_2": latent_vector.astype(np.float32).tolist()
        }]

        # Serialize the payload into JSON format
        data = json.dumps({"signature_name": "serving_default", "instances": instances})
        
        print(data)

        # Send the request to the GAN model
        headers = {"Content-Type": "application/json"}
        json_response = requests.post(url_gen, data=data, headers=headers)

        # Check for a successful response
        if json_response.status_code == 200:
            # Parse the JSON response to get the predictions (image data)
            predictions = json.loads(json_response.text)['predictions']

            # Assuming the predictions contain the image data as a 4D array: [batch_size, height, width, channels]
            image_array = np.array(predictions[0])  # Get the first image in the batch

            # Ensure the image is 28x28 with a single channel (grayscale)
            image_array = image_array.squeeze(axis=-1)  # Remove the last channel dimension (1) if it exists
            
            # Check the shape of the image
            print(f"Image shape after squeeze: {image_array.shape}")

            # Ensure the pixel values are in the range [0, 255] and cast to uint8
            image_array = np.clip(image_array * 255, 0, 255).astype(np.uint8)

            # Create a PIL Image from the numpy array
            img = Image.fromarray(image_array)

            # Save the image to the static directory
            image_filename = f"generated_image_{class_label}.png"
            image_path = os.path.join(IMAGE_DIR, image_filename)
            img.save(image_path)

            # Optionally, convert the image to base64 for embedding directly into HTML
            buffered = BytesIO()
            img.save(buffered, format="PNG")
            img_base64 = base64.b64encode(buffered.getvalue()).decode('utf-8')

            # Return the base64 image string (to embed in the HTML) or the image URL
            return img_base64  # You can also return image_path if you want to use the URL
        else:
            print(f"Error with GAN model API response: {json_response.status_code}, {json_response.content}")
            return None
    except Exception as e:
        print(f"Error generating image: {e}")
        return None
    
# Handle http://127.0.0.1:5000/history
@app.route('/history', methods=['GET', 'POST'])
def history():
    return render_template('history.html')

if __name__ == "__main__":
    app.run(debug=True)  # This will run the Flask app