from application import db
from flask import Blueprint, render_template, request, flash, redirect, url_for, session, jsonify
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
from sqlalchemy import func

# Create a Blueprint object
routes_bp = Blueprint('routes', __name__)

# # Server URL
# url_gen = 'https://gan-gen-ca2.onrender.com/v1/models/generator:predict'

# Path to the gen_images folder
IMAGE_DIR = os.path.join(os.path.dirname(__file__), 'gen_images')

# Ensure the directory exists
if not os.path.exists(IMAGE_DIR):
    os.makedirs(IMAGE_DIR)

# Route to serve files from the gen_images folder
@routes_bp.route('/gen_images/<filename>')
def serve_gen_images(filename):
    return send_from_directory(IMAGE_DIR, filename)

# runs every time render_template is called
@routes_bp.context_processor
def inject_user_logged_in():
    # Get the user_logged_in value and username from the session
    user_logged_in = session.get('user_logged_in', False)
    username = session.get('username', None) if user_logged_in else None
    return {
        'user_logged_in': user_logged_in,
        'username': username
    }

#Handles http://127.0.0.1:5000/
@routes_bp.route('/')
@routes_bp.route('/index')
@routes_bp.route('/home')
def home():
    # Get the user_logged_in value from the session
    user_logged_in = session.get('user_logged_in', False)
    return render_template("index.html", user_logged_in=user_logged_in)  # Use a template for your main page

# Login
login_manager = LoginManager(routes_bp)
login_manager.login_view = 'login'  # Redirect to 'login' route if not logged in
login_manager.login_message = "Please log in to access this page."

# Custom unauthorized handler for Flask-Login
@login_manager.unauthorized_handler
def unauthorized():
    flash('You need to log in to access this page.', 'danger')  # Flash a message
    return redirect(url_for('routes.login'))  # Redirect to the login page

@login_manager.user_loader
def load_user(user_id):
    return Login.query.get(int(user_id))

# Handle http://127.0.0.1:5000/login
@routes_bp.route('/login', methods=['GET', 'POST'])
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
            return redirect(url_for('routes.home'))
        else:
            flash('Invalid credentials. Please check your username, email, and password.', 'danger')

    return render_template('login.html', login_form=login_form)

@routes_bp.route('/signup', methods=['GET', 'POST'])
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
            return redirect(url_for('routes.home'))  # Redirect to the home page

    return render_template('signup.html', signup_form=signup_form)

# Handle http://127.0.0.1:5000/logout
@routes_bp.route('/logout')
def logout():
    logout_user()  # Use Flask-Login's logout_user function to clear the session
    session.pop('user_id', None)  # Explicitly clear user session data
    session.pop('username', None)  # Clear username if it's stored in session
    session.pop('user_logged_in', None)  # Clear the user_logged_in flag from session
    flash('You have been logged out.', 'info')
    return redirect(url_for('routes.home'))

# Function to remove previous image
def remove_previous_image():
    """
    This function removes all previously generated images in the 'gen_images' directory
    except for the most recent one, ensuring only one image exists at a time.
    """
    # Get the list of files in the 'gen_images' folder
    existing_images = os.listdir(IMAGE_DIR)
    
    # Filter out the image files (assuming image files have extensions like .png)
    image_files = [f for f in existing_images if f.endswith('.png')]

    # If there are any images, proceed with removal
    if image_files:
        # Sort images by creation time (ascending), so the latest one is the last
        image_files.sort(key=lambda x: os.path.getctime(os.path.join(IMAGE_DIR, x)))
        
        # Remove all images
        for image in image_files:
            file_path = os.path.join(IMAGE_DIR, image)
            try:
                os.remove(file_path)
            except Exception as e:
                print(f"Error removing image {image}: {e}")

        # After removal, leave the most recent image by not touching the last image
        latest_image = image_files[-1]

# Handle http://127.0.0.1:5000/predict
@routes_bp.route("/generate", methods=['GET', 'POST'])
@login_required
def generate():
    img_filename = None  # Variable to store the generated image filename
    class_label = None  # Variable to store the user's input

    if request.method == 'POST':
        remove_previous_image()  # Remove previous image before generating a new one

        class_label = request.form.get('class_label', '').lower()
        model_name = request.form.get('model_name', 'cgan').lower()  # Get model_name from frontend (default to 'cgan')

        if class_label and len(class_label) == 1 and class_label.isalpha():
            print(f"Generating image for class '{class_label}' using model: {model_name}")  # Debugging log

            # Generate the image using the selected model
            buffer, img_filename = generate_image_from_class(class_label, current_user.id, model_name=model_name)

            if img_filename:
                temp_path = os.path.join(IMAGE_DIR, img_filename)
                with open(temp_path, 'wb') as f:
                    f.write(buffer.getvalue())  # Write the image buffer to file

                return jsonify({
                    'success': True,
                    'class_label': class_label,
                    'image_url': url_for('routes.serve_gen_images', filename=img_filename),
                    'random_generate_button': False,
                    'temp_filename': img_filename,
                    'selected_model': model_name  # Return the model used
                })
            else:
                return jsonify({'success': False, 'error': 'Failed to generate image.'})
        else:
            flash('Please enter a valid class label (single letter A-Z)', 'danger')

    return render_template('generate.html', img_filename=img_filename, class_label=class_label)

# Handle http://127.0.0.1:5000/generate_random
@routes_bp.route('/generate_random', methods=['POST'])
def generate_random():
    # Get the selected model from the request JSON
    data = request.get_json()  # Parse the incoming JSON data
    model_name = data.get('model_name', 'cgan')  # Default to 'cgan' if model_name is not provided
    print(model_name, "generate_random")

    # Remove previous image before generating a new one
    remove_previous_image()

    # Generate a random letter (a-z)
    class_label = random.choice('abcdefghijklmnopqrstuvwxyz')
    
    # Generate the image using the random letter and current user's ID with the selected model
    buffer, img_filename = generate_image_from_class(class_label, current_user.id, model_name=model_name)  # Unpack the tuple
    if img_filename:
        # Save the temporary image to the gen_images folder
        temp_path = os.path.join(IMAGE_DIR, img_filename)
        with open(temp_path, 'wb') as f:
            f.write(buffer.getvalue())  # Write the BytesIO buffer to the file
        
        # Return the image URL and success status
        return jsonify({
            'success': True,
            'class_label': class_label,  # Send the random letter back to the client
            'image_url': url_for('routes.serve_gen_images', filename=img_filename),
            'random_generate_button': True,  # Indicate that this was a random generation
            'temp_filename': img_filename  # Pass the temporary filename to the frontend
        })
    else:
        flash('Failed to generate image.', 'danger')
        return jsonify({
            'success': False,
            'error': 'Failed to generate image.',
        })
    
# Helper function to validate the input
def validate_input(class_label):
    return bool(re.match(r'^[A-Za-z ]{1,50}$', class_label))

# Handle http://127.0.0.1:5000/generate_words
@routes_bp.route('/generate_words', methods=['POST'])
def generate_words():
    class_labels = request.form.get('class_label_combined', '').strip()
    model_name = request.form.get('model_name', 'cgan')  # Default to CGAN if not provided

    if not validate_input(class_labels):
        return jsonify({"success": False, "message": "Invalid input. Enter only A-Z and spaces, up to 50 characters."})
    
    remove_previous_image()

    images = []
    temp_filenames = []
    words = [class_labels[i:i+10] for i in range(0, len(class_labels), 10)]

    for word in words:
        word_images = []
        for letter in word:
            if letter == " ":
                sample_letter = "A"
                buffer, _ = generate_image_from_class(sample_letter, current_user.id, model_name)
                if buffer:
                    sample_img = Image.open(buffer)
                    img = Image.new("RGB", sample_img.size, color=sample_img.getpixel((0, 0)))
                else:
                    img = Image.new("RGB", (30, 30), color="white")
                word_images.append(img)
            else:
                buffer, img_filename = generate_image_from_class(letter, current_user.id, model_name)
                if buffer:
                    img = Image.open(buffer)
                    word_images.append(img)
                    temp_filenames.append(img_filename)

        if word_images:
            combined_word_img = Image.new('RGB', (sum(img.width for img in word_images), word_images[0].height))
            x_offset = 0
            for img in word_images:
                combined_word_img.paste(img, (x_offset, 0))
                x_offset += img.width
            images.append(combined_word_img)

    if images:
        total_height = sum(img.height for img in images)
        max_width = max(img.width for img in images)
        final_image = Image.new('RGB', (max_width, total_height))

        y_offset = 0
        for img in images:
            final_image.paste(img, (0, y_offset))
            y_offset += img.height

        timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
        unique_id = str(uuid.uuid4())[:8]
        unique_filename = f"user_{current_user.id}_combined_ts_{timestamp}_id_{unique_id}.png"
        final_path = os.path.join(IMAGE_DIR, unique_filename)
        final_image.save(final_path)

        return jsonify({
            "success": True,
            "class_label": class_labels,
            "image_url": url_for('routes.serve_gen_images', filename=unique_filename),
            "combined_img_filename": unique_filename,
            "temp_filenames": temp_filenames
        })

    return jsonify({"success": False, "message": "Could not generate image. Please try again."})

def generate_image_from_class(class_label, user_id, model_name):
    try:
        # Generate a 128-dimensional latent vector for DCGAN
        latent_vector_dcgan = np.random.rand(128).astype(np.float32)  # Shape: (1, 128)
        # Generate a 100-dimensional latent vector for CGAN
        latent_vector_cgan = np.random.rand(100).astype(np.float32)  # Shape: (1, 100)

        # Convert class label to an integer index (A=0, ..., Z=25)
        class_index = ord(class_label.lower()) - ord('a')
        # One-hot encode the class for CGAN (not needed for DCGAN)
        one_hot_encoded_class = np.array([1.0 if i == class_index else 0.0 for i in range(26)], dtype=np.float32)  

        # Prepare request payload based on the model type
        if model_name == 'cgan':
            instances = [{
                "input_3": one_hot_encoded_class.tolist(),  # One-hot label
                "input_2": latent_vector_cgan.tolist()      # Latent vector (100-dim)
            }]
        elif model_name == 'dcgan':
            instances = [{
                "input_1": latent_vector_dcgan.tolist()     # Only Latent vector (128-dim)
            }]
        else:
            print(f"Error: Unsupported model '{model_name}'")
            return None, None

        # Serialize the payload into JSON format
        data = json.dumps({"signature_name": "serving_default", "instances": instances})

        # API Endpoint
        url_gen = f'https://gan-gen-ca2.onrender.com/v1/models/{model_name}:predict'
        
        # Send request
        headers = {"Content-Type": "application/json"}
        json_response = requests.post(url_gen, data=data, headers=headers)

        # Check response status
        if json_response.status_code == 200:
            predictions = json.loads(json_response.text)['predictions']
            image_array = np.array(predictions[0])  # Extract image data

            # Process image
            image_array = image_array.squeeze(axis=-1)  
            image_array = np.clip(image_array * 255, 0, 255).astype(np.uint8)
            img = Image.fromarray(image_array)
            img = img.resize((300, 300), Image.Resampling.LANCZOS)

            # Generate filename
            unique_id = str(uuid.uuid4())[:8]
            timestamp = datetime.now().strftime("%Y%m%d%H%M")
            image_filename = f"user_{user_id}_ts_{timestamp}_id_{unique_id}.png"

            # Save to buffer
            buffer = BytesIO()
            img.save(buffer, format="PNG")
            buffer.seek(0)

            return buffer, image_filename
        else:
            print(f"Error with GAN model API response: {json_response.status_code}, {json_response.content}")
            return None, None
    except Exception as e:
        print(f"Error generating image: {e}")
        return None, None

@routes_bp.route('/save_image', methods=['POST'])
@login_required
def save_image():
    try:
        # Parse the JSON payload
        data = request.get_json()

        temp_filename = data.get('temp_filename')
        class_label = data.get('class_label')
        model_name = data.get('model_name')

        if not temp_filename or not class_label or not model_name:
            print("Missing temp_filename, class_label, or model_name")
            return jsonify({'success': False, 'error': 'Missing required data.'}), 400

        # Load the temporary image from the gen_images folder
        temp_path = os.path.join(IMAGE_DIR, temp_filename)
        if not os.path.exists(temp_path):
            print(f"Image not found: {temp_path}")
            return jsonify({'success': False, 'error': 'Temporary image file not found.'}), 400

        # Open the image and save it to an in-memory buffer
        with open(temp_path, 'rb') as f:
            buffer = BytesIO(f.read())

        # Generate a unique identifier and timestamp for the final image
        unique_id = str(uuid.uuid4())[:8]
        timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
        image_filename = f"user_{current_user.id}_ts_{timestamp}_id_{unique_id}.png"

        # Upload the image to Backblaze B2
        backblaze_helper = BackblazeHelper()
        uploaded_filename = backblaze_helper.upload_file(buffer, image_filename)

        # Generate a signed URL with a longer expiration time (e.g., 24 hours)
        signed_url = backblaze_helper.generate_signed_url(uploaded_filename, expiration_time=86400)

        # Save the image metadata (including the signed URL) to the database
        new_prediction = ImagePrediction(
            user_id=current_user.id,
            image_filename=uploaded_filename,
            image_url=signed_url,  # Store the signed URL
            class_label=class_label,
            model_name=model_name
        )
        db.session.add(new_prediction)
        db.session.commit()

        # Clean up the temporary image
        if os.path.exists(temp_path):
            os.remove(temp_path)

        # Return success response
        return jsonify({'success': True, 'redirect_url': url_for('routes.history')})

    except Exception as e:
        print(f"Error saving image: {e}")
        return jsonify({'success': False, 'error': 'An error occurred while saving the image.'}), 500

def count_saved_models(model_type):
    # Replace with actual logic to count saved models based on the model type
    return db.session.query(ImagePrediction).filter_by(model_name=model_type).count()

def get_first_prediction_time():
    """
    Returns the datetime of the very first prediction made by the current user.
    If the user has no predictions, returns the current time.
    """
    first_prediction = ImagePrediction.query.filter_by(user_id=current_user.id)\
                        .order_by(ImagePrediction.predicted_on.asc()).first()
    if first_prediction:
        return first_prediction.predicted_on
    else:
        # If no prediction exists, return the current time (or you could return None)
        return datetime.utcnow()
    
# Handle http://127.0.0.1:5000/history
@routes_bp.route('/history')
@login_required
def history():
    page = request.args.get('page', 1, type=int)
    generations = ImagePrediction.query.filter_by(user_id=current_user.id).paginate(page=page, per_page=4)
    username = current_user.username

    # Check if there are any predictions before accessing predicted_on
    first_prediction = ImagePrediction.query.filter_by(user_id=current_user.id).order_by(ImagePrediction.predicted_on).first()
    last_prediction = ImagePrediction.query.filter_by(user_id=current_user.id).order_by(ImagePrediction.predicted_on.desc()).first()

    min_date_iso = first_prediction.predicted_on.isoformat() if first_prediction else None
    max_date_iso = last_prediction.predicted_on.isoformat() if last_prediction else None

    # Get the deleted count from the session, default to 0 if not set
    deleted_count = session.get('deleted_count', 0)

    first_prediction_time = get_first_prediction_time()  # your existing helper
    saved_models = {
        'cgan': count_saved_models('cgan'),
        'dcgan': count_saved_models('dcgan')
    }

    return render_template('history.html',
                           generations=generations,
                           username=username,
                           deleted_count=deleted_count,
                           first_prediction_time=first_prediction_time,
                           min_date=min_date_iso,
                           max_date=max_date_iso,
                           saved_models=saved_models)

# Handle http://127.0.0.1:5000/delete_prediction
@routes_bp.route('/delete_prediction/<int:prediction_id>', methods=['POST'])
@login_required
def delete_prediction(prediction_id):
    try:
        # Retrieve the prediction from the database
        prediction = ImagePrediction.query.get_or_404(prediction_id)

        # Ensure the current user owns this prediction
        if prediction.user_id != current_user.id:
            return jsonify({'success': False, 'error': 'Unauthorized action.'}), 403

        # Remove the image from Backblaze B2 using the new delete_file method
        backblaze_helper = BackblazeHelper()
        delete_success = backblaze_helper.delete_all_versions(prediction.image_filename)

        if not delete_success:
            return jsonify({'success': False, 'error': 'Failed to delete image from cloud storage.'}), 500

        # Delete the prediction from the database
        db.session.delete(prediction)
        db.session.commit()

        # Increment the delete count in the session
        if 'deleted_count' not in session:
            session['deleted_count'] = 0
        session['deleted_count'] += 1

        return jsonify({'success': True, 'message': 'Prediction deleted successfully.'})

    except Exception as e:
        print(f"Error deleting prediction: {e}")
        return jsonify({'success': False, 'error': 'An error occurred while deleting the prediction.'}), 500

# Handle http://127.0.0.1:5000/filter_predictions
@routes_bp.route('/filter_predictions', methods=['POST'])
def filter_predictions():
    data = request.get_json()
    class_label = data.get('class_label')
    class_label_length = data.get('class_label_length')
    model = data.get('model')

    # Log the incoming data for debugging
    print(f"Received filters: class_label={class_label}, class_label_length={class_label_length}, model={model}")

    query = ImagePrediction.query.filter_by(user_id=current_user.id)

    # Apply filters if present
    if class_label:
        query = query.filter(ImagePrediction.class_label.like(f'{class_label}%'))

    if model:
        query = query.filter_by(model_name=model)

    if class_label_length:
        query = query.filter(func.length(ImagePrediction.class_label) <= int(class_label_length))

    filtered_predictions = query.all()

    # Check by manually constructing the dict
    filtered_predictions_dict = [{
        'id': prediction.id,
        'image_url': prediction.image_url,
        'class_label': prediction.class_label,
        'model_name': prediction.model_name,
        'predicted_on': prediction.predicted_on
    } for prediction in filtered_predictions]

    return jsonify({'filtered_predictions': filtered_predictions_dict})

# Dummy page
@routes_bp.route("/dummy")
def dummy():
	return "<h1>About Me</h1>"


###############################################################
#################### API SECTION ##############################
###############################################################
## LOGIN API (LOGIN AS USER)
@routes_bp.route('/api/login', methods=['POST'])
def api_login():
    data = request.get_json()
    username = data.get('username')
    email = data.get('email')
    password = data.get('password')

    user = Login.query.filter_by(username=username, email=email).first()

    if user and check_password_hash(user.password_hash, password):
        login_user(user)
        session['user_id'] = user.id
        session['username'] = user.username
        session['user_logged_in'] = True

        return jsonify({'success': True, 'message': 'Login successful'})
    else:
        return jsonify({'success': False, 'message': 'Invalid credentials'})

## LOGIN API (RETRIEVE USER INFO)
@routes_bp.route("/api/user_info", methods=['GET'])
@login_required
def api_user_info():
    # Retrieve user information from the current_user object
    user_info = {
        'username': current_user.username,
        'email': current_user.email,
        'created_on': current_user.created_on.strftime("%Y-%m-%d %H:%M:%S")  # Assuming 'created_on' is a datetime field
    }
    return jsonify({
        'success': True,
        'user_info': user_info
    })

## SIGNUP API
@routes_bp.route('/api/signup', methods=['POST'])
def api_signup():
    data = request.get_json()
    username = data.get('username')
    email = data.get('email')
    password = data.get('password')

    if Login.query.filter_by(email=email).first():
        return jsonify({'success': False, 'message': 'Email already in use'})

    hashed_password = generate_password_hash(password, method='pbkdf2:sha256')
    new_user = Login(username=username, email=email, password_hash=hashed_password)
    db.session.add(new_user)
    db.session.commit()

    login_user(new_user)
    session['user_id'] = new_user.id
    session['username'] = new_user.username
    session['user_logged_in'] = True

    return jsonify({'success': True, 'message': 'Signup successful'})

## PREDICT API
@routes_bp.route("/api/generate", methods=['POST'])
@login_required
def api_generate():
    data = request.get_json()
    class_label = data.get('class_label', '').lower()
    model_name = data.get('model_name', 'cgan')

    if class_label and len(class_label) == 1 and class_label.isalpha():
        buffer, img_filename = generate_image_from_class(class_label, current_user.id, model_name=model_name)

        if img_filename:
            img_url = url_for('routes.serve_gen_images', filename=img_filename, _external=True)
            return jsonify({
                'success': True,
                'class_label': class_label,
                'image_url': img_url
            })
        else:
            return jsonify({'success': False, 'message': 'Image generation failed'})
    else:
        return jsonify({'success': False, 'message': 'Invalid class label'})
    
## PREDICT RANDOM API
@routes_bp.route("/api/generate_random", methods=['POST'])
def api_generate_random():
    data = request.get_json()
    model_name = data.get('model_name', 'cgan')

    class_label = random.choice('abcdefghijklmnopqrstuvwxyz')
    buffer, img_filename = generate_image_from_class(class_label, current_user.id, model_name=model_name)

    if img_filename:
        img_url = url_for('routes.serve_gen_images', filename=img_filename, _external=True)
        return jsonify({
            'success': True,
            'class_label': class_label,
            'image_url': img_url
        })
    else:
        return jsonify({'success': False, 'message': 'Random image generation failed'})

## SAVE IMAGE API
@routes_bp.route("/api/save_image", methods=['POST'])
@login_required
def api_save_image():
    data = request.get_json()
    temp_filename = data.get('temp_filename')
    class_label = data.get('class_label')
    model_name = data.get('model_name')

    if not temp_filename or not class_label or not model_name:
        return jsonify({'success': False, 'message': 'Missing required fields'})

    temp_path = os.path.join(IMAGE_DIR, temp_filename)

    if os.path.exists(temp_path):
        with open(temp_path, 'rb') as f:
            buffer = BytesIO(f.read())

        unique_id = str(uuid.uuid4())[:8]
        timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
        image_filename = f"user_{current_user.id}_ts_{timestamp}_id_{unique_id}.png"

        uploaded_filename = BackblazeHelper().upload_file(buffer, image_filename)

        new_prediction = ImagePrediction(
            user_id=current_user.id,
            image_filename=uploaded_filename,
            class_label=class_label,
            model_name=model_name
        )
        db.session.add(new_prediction)
        db.session.commit()

        # Clean up temporary image
        os.remove(temp_path)

        return jsonify({'success': True, 'message': 'Image saved successfully'})
    else:
        return jsonify({'success': False, 'message': 'Temporary image not found'})

## HISTORY API
@routes_bp.route("/api/history", methods=['GET'])
@login_required
def api_history():
    page = request.args.get('page', 1, type=int)
    per_page = 4
    generations = ImagePrediction.query.filter_by(user_id=current_user.id).paginate(page=page, per_page=per_page)

    history = []
    backblaze_helper = BackblazeHelper()

    for generation in generations.items:
        img_url = backblaze_helper.generate_signed_url(generation.image_filename)
        history.append({
            'image_url': img_url,
            'class_label': generation.class_label,
            'model_name': generation.model_name
        })

    return jsonify({'success': True, 'history': history})

if __name__ == "__main__":
    routes_bp.run(debug=True)  # This will run the Flask app
