from application import db
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import UserMixin
from sqlalchemy.orm import validates
from datetime import datetime
import pytz
from flask_sqlalchemy import SQLAlchemy

# UserMixin ensures compatibility with Flask-Login by automatically providing:

# is_authenticated: Always True for logged-in users.
# is_active: Indicates whether the account is active (you can customize its behavior).
# is_anonymous: Always False for logged-in users.
# get_id: Returns the id of the user (used to uniquely identify users in the session).

# Function to get the current time in Singapore Time
def get_singapore_time():
    # Get the current time in UTC
    utc_now = datetime.utcnow()
    # Define the Singapore Time zone
    singapore_timezone = pytz.timezone('Asia/Singapore')
    # Convert UTC time to Singapore Time
    singapore_time = utc_now.replace(tzinfo=pytz.utc).astimezone(singapore_timezone)
    # Remove timezone information to store a naive datetime (if your database doesn't support timezone-aware datetimes)
    return singapore_time.replace(tzinfo=None)

# Each login user can have multiple instances of HealthInsurancePrediction
class Login(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(120), nullable=False, unique=True)
    password_hash = db.Column(db.String(200), nullable=False)  # Securely store hashed passwords
    created_on = db.Column(db.DateTime, nullable=False, default=get_singapore_time)  # Use Singapore Time as default

    # Composite unique constraint for username and email
    __table_args__ = (db.UniqueConstraint('username', 'email', name='unique_username_email'),)

    # Method to hash the password
    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    # Method to verify the password
    def check_password(self, password):
        return check_password_hash(self.password_hash, password)
    
    def get_id(self):
        return str(self.id)