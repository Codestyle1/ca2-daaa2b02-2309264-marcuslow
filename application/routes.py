from application import app, db
from flask import render_template, request, flash, redirect, url_for, session, jsonify
from application.forms import LoginForm, SignupForm
from application.models import Login, ImagePrediction
from flask_login import LoginManager, login_required, login_user, current_user, logout_user
from werkzeug.security import check_password_hash, generate_password_hash
from PIL import Image
import numpy as np
import json
import numpy as np
import requests
import os
from flask import send_from_directory
import random
import uuid  # For generating unique IDs
from datetime import datetime
from io import BytesIO
import os
from application.backblaze_helper import BackblazeHelper  # Import the Backblaze helper
import re

# # Server URL
# url_gen = 'https://gan-gen-ca2.onrender.com/v1/models/generator:predict'

# Path to the gen_images folder
IMAGE_DIR = os.path.join(os.path.dirname(__file__), 'gen_images')

# Ensure the directory exists
if not os.path.exists(IMAGE_DIR):
    os.makedirs(IMAGE_DIR)

# Route to serve files from the gen_images folder
@app.route('/gen_images/<filename>')
def serve_gen_images(filename):
    return send_from_directory(IMAGE_DIR, filename)

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

# Custom unauthorized handler for Flask-Login
@login_manager.unauthorized_handler
def unauthorized():
    flash('You need to log in to access this page.', 'danger')  # Flash a message
    return redirect(url_for('login'))  # Redirect to the login page

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
            # Hash the password
            hashed_password = generate_password_hash(password, method='pbkdf2:sha256')
            
            # Create a new user
            new_user = Login(username=username, email=email, password_hash=hashed_password)
            
            # Add the new user to the database
            db.session.add(new_user)
            db.session.commit()

            # Log the user in immediately after signup
            login_user(new_user)  # Authenticate the user and create a session

            # Update the session to reflect that the user is logged in
            session['user_id'] = new_user.id
            session['username'] = new_user.username
            session['user_logged_in'] = True

            flash('Signup successful! You are now logged in.', 'success')
            return redirect(url_for('home'))  # Redirect to the home page

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
@login_required
def predict():
    img_filename = None  # Variable to store the generated image filename
    class_label = None  # Variable to store the user's input

    if request.method == 'POST':
        # Retrieve the class label input from the form
        class_label = request.form.get('class_label').lower()

        if class_label and len(class_label) == 1 and class_label.isalpha():
            # Generate the image using the provided class label
            buffer, img_filename = generate_image_from_class(class_label, current_user.id, model_name="cgan")

            if img_filename:
                # Save the temporary image to the gen_images folder
                temp_path = os.path.join(IMAGE_DIR, img_filename)
                with open(temp_path, 'wb') as f:
                    f.write(buffer.getvalue())  # Write the BytesIO buffer to the file

                # Return the image URL and success status
                return jsonify({
                    'success': True,
                    'class_label': class_label,  # Send the class label back to the client
                    'image_url': url_for('serve_gen_images', filename=img_filename),
                    'random_generate_button': False,  # Indicate this was not a random generation
                    'temp_filename': img_filename  # Pass the temporary filename to the frontend
                })
            else:
                return jsonify({
                    'success': False,
                    'error': 'Failed to generate image.',
                })
        else:
            flash('Please enter a valid class label (single letter A-Z)', 'danger')

    # If it's a GET request or validation fails, render the template
    return render_template('predict.html', img_filename=img_filename, class_label=class_label)

# Helper function to validate the input
def validate_input(class_label):
    return bool(re.match(r'^[A-Z ]{1,50}$', class_label))

# Handle /predict_words
@app.route('/predict_words', methods=['POST'])
def predict_words():
    class_labels = request.form.get('class_label_combined').upper().strip()

    # Validation: Only allow letters A-Z and spaces, up to 50 characters
    if not validate_input(class_labels):
        flash('Please enter up to 50 letters (A-Z), spaces are allowed but they do not count toward the limit.', 'danger')
        return jsonify({"success": False, "message": "Invalid input. Enter only A-Z and spaces, up to 50 characters."})

    images = []
    temp_filenames = []

    # Split input into 10-character chunks, including spaces
    words = [class_labels[i:i+10] for i in range(0, len(class_labels), 10)]

    for word in words:
        word_images = []
        for letter in word:
            if letter == " ":
                # Handle space as a placeholder
                sample_letter = "A"  # Using "A" as a placeholder for spacing
                buffer, _ = generate_image_from_class(sample_letter, current_user.id, model_name="cgan")
                if buffer:
                    sample_img = Image.open(buffer)
                    img = Image.new("RGB", sample_img.size, color=sample_img.getpixel((0, 0)))  # Match background color
                else:
                    img = Image.new("RGB", (30, 30), color="white")  # Fallback default
                word_images.append(img)
            else:
                buffer, img_filename = generate_image_from_class(letter, current_user.id, model_name="cgan")
                if buffer:
                    img = Image.open(buffer)
                    word_images.append(img)
                    temp_filenames.append(img_filename)

        # Combine letters horizontally for each word
        if word_images:
            combined_word_img = Image.new('RGB', (sum(img.width for img in word_images), word_images[0].height))
            x_offset = 0
            for img in word_images:
                combined_word_img.paste(img, (x_offset, 0))
                x_offset += img.width
            images.append(combined_word_img)

    # Combine rows vertically
    if images:
        total_height = sum(img.height for img in images)
        max_width = max(img.width for img in images)
        final_image = Image.new('RGB', (max_width, total_height))

        y_offset = 0
        for img in images:
            final_image.paste(img, (0, y_offset))
            y_offset += img.height

        final_filename = f"user_{current_user.id}_combined_{datetime.now().strftime('%Y%m%d%H%M%S')}.png"
        final_path = os.path.join(IMAGE_DIR, final_filename)
        final_image.save(final_path)

        return jsonify({
            "success": True,
            "class_label": class_labels,
            "image_url": f"/gen_images/{final_filename}",
            "combined_img_filename": final_filename,
            "temp_filenames": temp_filenames
        })

    return jsonify({"success": False, "message": "Could not generate image. Please try again."})

# Handle http://127.0.0.1:5000/predict_random
@app.route('/predict_random', methods=['POST'])
def predict_random():
    # Generate a random letter (a-z)
    class_label = random.choice('abcdefghijklmnopqrstuvwxyz')
    # Generate the image using the random letter and current user's ID
    buffer, img_filename = generate_image_from_class(class_label, current_user.id, model_name="cgan")  # Unpack the tuple
    if img_filename:
        # Save the temporary image to the gen_images folder
        temp_path = os.path.join(IMAGE_DIR, img_filename)
        with open(temp_path, 'wb') as f:
            f.write(buffer.getvalue())  # Write the BytesIO buffer to the file
        
        # Return the image URL and success status
        return jsonify({
            'success': True,
            'class_label': class_label,  # Send the random letter back to the client
            'image_url': url_for('serve_gen_images', filename=img_filename),
            'random_generate_button': True,  # Indicate that this was a random generation
            'temp_filename': img_filename  # Pass the temporary filename to the frontend
        })
    else:
        flash('Failed to generate image.', 'danger')
        return jsonify({
            'success': False,
            'error': 'Failed to generate image.',
        })

def generate_image_from_class(class_label, user_id, model_name):
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

        # # Server URL
        url_gen = f'https://gan-gen-ca2.onrender.com/v1/models/{model_name}:predict'

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
            # Ensure the pixel values are in the range [0, 255] and cast to uint8
            image_array = np.clip(image_array * 255, 0, 255).astype(np.uint8)
            # Create a PIL Image from the numpy array
            img = Image.fromarray(image_array)
            # Resize the image to 300x300 pixels
            img = img.resize((300, 300), Image.Resampling.LANCZOS)  # Use high-quality resampling
            # Generate a unique identifier
            unique_id = str(uuid.uuid4())[:8]  # First 8 characters of a UUID
            # Get the current timestamp
            timestamp = datetime.now().strftime("%Y%m%d%H%M")  # Format: YYYYMMDDHHMMSS
            # Construct the filename with user_id, class_label, timestamp, and unique_id
            image_filename = f"user_{user_id}_label_{class_label}_ts_{timestamp}_id_{unique_id}.png"
            # Save the image to an in-memory buffer
            buffer = BytesIO()
            img.save(buffer, format="PNG")
            buffer.seek(0)  # Rewind the buffer to the beginning
            # Return the buffer and the filename
            return buffer, image_filename
        else:
            print(f"Error with GAN model API response: {json_response.status_code}, {json_response.content}")
            return None, None
    except Exception as e:
        print(f"Error generating image: {e}")
        return None, None

@app.route('/save_image', methods=['POST'])
@login_required
def save_image():
    try:
        # Parse the JSON payload
        data = request.get_json()
        temp_filename = data.get('temp_filename')  
        class_label = data.get('class_label')

        if not temp_filename or not class_label:
            return jsonify({'success': False, 'error': 'Missing temporary filename or class label.'}), 400

        # Load the temporary image from the gen_images folder
        temp_path = os.path.join(IMAGE_DIR, temp_filename)
        if not os.path.exists(temp_path):
            return jsonify({'success': False, 'error': 'Temporary image file not found.'}), 400

        # Open the image and save it to an in-memory buffer
        with open(temp_path, 'rb') as f:
            buffer = BytesIO(f.read())

        # Generate a unique identifier and timestamp
        unique_id = str(uuid.uuid4())[:8]  
        timestamp = datetime.now().strftime("%Y%m%d%H%M%S")  
        image_filename = f"user_{current_user.id}_label_{class_label}_ts_{timestamp}_id_{unique_id}.png"

        # Upload the image to Backblaze B2
        uploaded_filename = BackblazeHelper().upload_file(buffer, image_filename)

        # Save the image metadata to the database
        new_prediction = ImagePrediction(
            user_id=current_user.id,
            image_filename=uploaded_filename,
            class_label=class_label
        )
        db.session.add(new_prediction)
        db.session.commit()

        # Delete the temporary image file after saving
        os.remove(temp_path)

        # Return JSON response with success and redirection URL
        return jsonify({'success': True, 'redirect_url': url_for('history')})

    except Exception as e:
        print(f"Error saving image: {e}")
        return jsonify({'success': False, 'error': 'An error occurred while saving the image.'}), 500

# Handle http://127.0.0.1:5000/history
@app.route('/history', methods=['GET'])
@login_required
def history():
    page = request.args.get('page', 1, type=int)
    per_page = 4 # Number of predictions per page
    
    # Fetch predictions with pagination
    predictions = ImagePrediction.query.filter_by(user_id=current_user.id).paginate(page=page, per_page=per_page)
    
    # Generate signed URLs for each image
    backblaze_helper = BackblazeHelper()
    for prediction in predictions.items:
        prediction.image_url = backblaze_helper.generate_signed_url(prediction.image_filename)
    
    return render_template('history.html', predictions=predictions)

if __name__ == "__main__":
    app.run(debug=True)  # This will run the Flask app