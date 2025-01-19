from application import app
from application import db
from flask import render_template, request, flash, redirect, url_for, session
from application.forms import LoginForm, SignupForm
from application.models import Login
from flask_login import LoginManager, login_required, login_user, current_user, logout_user
from werkzeug.security import check_password_hash, generate_password_hash
from flask_cors import CORS, cross_origin
from tensorflow.keras.preprocessing import image
from PIL import Image, ImageOps
import numpy as np
import tensorflow.keras.models
import re
import base64
from io import BytesIO
# from tensorflow.keras.datasets.mnist import load_data
import json
import numpy as np
import requests
import pathlib, os
def parseImage(imgData):
    # parse canvas bytes and save as output.png
    imgstr = re.search(b'base64,(.*)', imgData).group(1)
    with open('output.png','wb') as output:
        output.write(base64.decodebytes(imgstr))
        im = Image.open('output.png').convert('RGB')
        im_invert = ImageOps.invert(im)
        im_invert.save('output.png')

def make_prediction(instances):
    data = json.dumps({"signature_name": "serving_default", "instances":
    instances.tolist()})
    headers = {"content-type": "application/json"}
    json_response = requests.post(url, data=data, headers=headers)
    predictions = json.loads(json_response.text)['predictions']
    return predictions

#Server URL – change xyz to Practical 7 deployed URL [TAKE NOTE]
url = 'https://gan-model-app-ca2.onrender.com/v1/models/saved_GAN_models'

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


#Handles http://127.0.0.1:5000/predict
@app.route("/predict", methods=['GET','POST'])
@cross_origin(origin='localhost',headers=['Content- Type','Authorization'])
def predict():
    # get data from drawing canvas and save as image
    parseImage(request.get_data())
    # Decoding and pre-processing base64 image
    img = image.img_to_array(image.load_img("output.png", color_mode="grayscale",
    target_size=(28, 28))) / 255.
    # reshape data to have a single channel
    img = img.reshape(1,28,28,1)
    predictions = make_prediction(img)
    ret = ""
    for i, pred in enumerate(predictions):
        ret = "{}".format(np.argmax(pred))
        response = ret
        return response