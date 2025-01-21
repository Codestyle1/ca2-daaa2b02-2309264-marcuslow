from application import db
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import UserMixin
from sqlalchemy.orm import validates
from datetime import datetime

# UserMixin ensures compatibility with Flask-Login by automatically providing:

# is_authenticated: Always True for logged-in users.
# is_active: Indicates whether the account is active (you can customize its behavior).
# is_anonymous: Always False for logged-in users.
# get_id: Returns the id of the user (used to uniquely identify users in the session).

# Each login user can have multiple instances of HealthInsurancePrediction
class Login(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(120), nullable=False, unique=True)
    password_hash = db.Column(db.String(200), nullable=False)  # Securely store hashed passwords
    created_on = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)

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