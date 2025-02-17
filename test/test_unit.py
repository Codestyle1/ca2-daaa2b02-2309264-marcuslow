import pytest
from flask import url_for
from application.models import Login, ImagePrediction
from application import db
from sqlalchemy.exc import IntegrityError
from werkzeug.security import generate_password_hash
from conftest import test_client, test_app  # Import the test_client fixture
from flask_login import login_user
from datetime import datetime
import uuid


##################################
# Unit Testing - Validity Testing
###################################
# Unit test for valid login
def test_valid_login(test_client, test_app):
    """Test the login process with valid data."""
    # Create a user in the test database (or use a mock)
    user = Login(username='test', email='test@example.com', password_hash=generate_password_hash('password'))
    
    with test_app.app_context():
        db.session.add(user)
        db.session.commit()

    # Simulate a login attempt by sending a POST request
    response = test_client.post('/login', data={'username': 'test', 'email': 'test@example.com', 'password': 'password'})

    # Check if the response is a redirect (status code 302)
    assert response.status_code == 302

    # Check if the user is redirected to the correct location (home page)
    assert response.headers['Location'] == '/home'  # Use the relative URL

    # Check if the login was successful by verifying the presence of session data
    with test_client.session_transaction() as sess:
        assert 'user_id' in sess  # Check if the user ID is in the session
        assert 'username' in sess  # Check if the username is in the session
        assert sess['username'] == 'test'  # Ensure the session contains the correct username

    # You might want to follow up with another request to the home page to check for the flash message
    response = test_client.get('/home')  # Follow up with the home page request
    assert b'Login successful!' in response.data  # Check for the flash message indicating successful login

###############################
######## Range Testing #########
###############################
# Range Testing for valid ImagePrediction entries (without images)
@pytest.mark.parametrize("class_label, model_name", [
    ("A", "cgan"),  # Valid case 1
    ("B", "dcgan"),  # Valid case 2
    ("C", "gan"),  # Valid case 3
    ("D", "pix2pix")  # Valid case 4
])
def test_valid_image_prediction(test_client, test_app, class_label, model_name):
    """Test creating ImagePrediction instances with various valid ranges (without image)."""
    
    # Create a unique email by appending class_label to avoid duplicates
    unique_email = f"test_{class_label}@example.com"

    # Create a user with a unique email
    user = Login(username=f'testuser_{class_label}', email=unique_email, password_hash=generate_password_hash('password'))
    
    with test_app.app_context():
        db.session.add(user)
        db.session.commit()  # Commit user to DB
        db.session.refresh(user)  # Ensure user is persistent

        # Create a new ImagePrediction instance with valid test data
        image_prediction = ImagePrediction(
            user_id=user.id,
            class_label=class_label,
            model_name=model_name,
            image_filename="test_image.png",  # Dummy image filename
            predicted_on=datetime(2025, 2, 16)  # Correct usage of datetime
        )

        # Add the new ImagePrediction to the session
        db.session.add(image_prediction)
        db.session.commit()

        # Fetch the ImagePrediction from the database to verify the values
        saved_prediction = ImagePrediction.query.filter_by(id=image_prediction.id).first()

        # Validate the saved ImagePrediction matches the test data
        assert saved_prediction.class_label == class_label
        assert saved_prediction.model_name == model_name
        assert saved_prediction.image_filename == "test_image.png"  # Check for the dummy filename


#############################################
########### Functionality Testing ###########
#############################################
def test_predicted_on_default(test_client, test_app):
    # Create a valid data dictionary without 'predicted_on'
    valid_data = {
        'user_id': 1,
        'class_label': 'a',
        'model_name': 'dcgan',
        'image_filename': 'test.png'
    }

    with test_client.application.app_context():
        new_image = ImagePrediction(**valid_data)
        db.session.add(new_image)
        db.session.commit()

        # Fetch the record to check if predicted_on is set correctly
        created_image = db.session.get(ImagePrediction, new_image.id)
        assert created_image.predicted_on is not None, "predicted_on should not be None"


#############################################
######## Unexpected Failure Testing #########
#############################################
## Function to test for missing fields
# Unexpected Failure Testing (Missing Fields)
# List of all fields in the ImagePrediction model
def test_missing_all_fields(test_client, test_app):
    # List of all fields in the model (excluding 'predicted_on' since it has a default value)
    all_fields = [
        'user_id', 'class_label', 'model_name', 'image_filename'
    ]

    # Create a valid data dictionary (all fields correctly filled in)
    valid_data = {
        'user_id': 1,
        'class_label': 'a',
        'model_name': 'dcgan',
        'image_filename': 'test.png',
        'predicted_on': datetime(2025, 2, 16)  # Include 'predicted_on' in valid data but exclude in test
    }

    # Iterate through each field and set it to None, excluding 'predicted_on'
    for field in all_fields:
        invalid_data = valid_data.copy()  # Copy the valid data
        invalid_data[field] = None  # Set the current field to None

        # Test that an IntegrityError is raised when trying to insert invalid data with the current field set to None
        try:
            with test_client.application.app_context():
                new_image = ImagePrediction(**invalid_data)
                db.session.add(new_image)
                db.session.commit()  # This should fail due to the missing field
            assert False, f"Expected IntegrityError but did not raise for field {field}"
        except IntegrityError as e:
            print(f"IntegrityError caught for field {field}: {e}")  # Log the error for other fields
            db.session.rollback()  # Rollback after exception
            pass  # Expected behavior

    # Now, test the behavior of 'predicted_on' separately
    invalid_data = valid_data.copy()
    invalid_data['predicted_on'] = None  # Set 'predicted_on' to None
    with test_client.application.app_context():
        new_image = ImagePrediction(**invalid_data)
        db.session.add(new_image)
        db.session.commit()  # 'predicted_on' should automatically get the default value

        # Fetch the record and ensure the predicted_on is set to the default value
        created_image = db.session.get(ImagePrediction, new_image.id)
        assert created_image.predicted_on is not None, "predicted_on should not be None"
        print(f"predicted_on is correctly set to default value: {created_image.predicted_on}")

