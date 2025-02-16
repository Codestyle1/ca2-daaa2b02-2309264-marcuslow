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
@app.route("/predict", methods=['GET', 'POST'])
@login_required
def predict():
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
                    'image_url': url_for('serve_gen_images', filename=img_filename),
                    'random_generate_button': False,
                    'temp_filename': img_filename,
                    'selected_model': model_name  # Return the model used
                })
            else:
                return jsonify({'success': False, 'error': 'Failed to generate image.'})
        else:
            flash('Please enter a valid class label (single letter A-Z)', 'danger')

    return render_template('predict.html', img_filename=img_filename, class_label=class_label)

# Handle http://127.0.0.1:5000/predict_random
@app.route('/predict_random', methods=['POST'])
def predict_random():
    # Get the selected model from the request JSON
    data = request.get_json()  # Parse the incoming JSON data
    model_name = data.get('model_name', 'dcgan')  # Default to 'cgan' if model_name is not provided
    print(model_name, "predict_random")

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
    
# Helper function to validate the input
def validate_input(class_label):
    return bool(re.match(r'^[A-Za-z ]{1,50}$', class_label))

# Handle http://127.0.0.1:5000/predict_words
@app.route('/predict_words', methods=['POST'])
def predict_words():
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
            "image_url": url_for('serve_gen_images', filename=unique_filename),
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

@app.route('/save_image', methods=['POST'])
@login_required
def save_image():
    try:
        # Parse the JSON payload
        data = request.get_json()

        temp_filename = data.get('temp_filename')  # Now receiving the combined image filename
        class_label = data.get('class_label')
        model_name = data.get('model_name')

        if not temp_filename or not class_label or not model_name:
            print("Missing temp_filename, class_label, or model_name")  # Debugging line to check what is missing
            return jsonify({'success': False, 'error': 'Missing required data (temp_filename, class_label, model_name).'}), 400

        # Load the temporary image from the gen_images folder
        temp_path = os.path.join(IMAGE_DIR, temp_filename)
        if not os.path.exists(temp_path):
            print(f"Image not found: {temp_path}")  # Debugging line to check file existence
            return jsonify({'success': False, 'error': 'Temporary image file not found.'}), 400

        # Open the image and save it to an in-memory buffer
        with open(temp_path, 'rb') as f:
            buffer = BytesIO(f.read())

        # Generate a unique identifier and timestamp for the final image
        unique_id = str(uuid.uuid4())[:8]
        timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
        image_filename = f"user_{current_user.id}_ts_{timestamp}_id_{unique_id}.png"

        # Upload the image to Backblaze B2
        uploaded_filename = BackblazeHelper().upload_file(buffer, image_filename)

        # Save the image metadata to the database
        new_prediction = ImagePrediction(
            user_id=current_user.id,
            image_filename=uploaded_filename,
            class_label=class_label,
            model_name=model_name  # Store the selected model name in the database
        )
        db.session.add(new_prediction)
        db.session.commit()

        # Clean up the temporary image
        if os.path.exists(temp_path):
            os.remove(temp_path)

        # Return success response
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