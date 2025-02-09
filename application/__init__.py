from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

# instantiate SQLAlchemy to handle db process
db = SQLAlchemy()

#create the Flask app
app = Flask(__name__)

# load configuration from config.cfg
app.config.from_pyfile('config.cfg')
app.config['SQLALCHEMY_DATABASE_URI'] = "sqlite:///database.db"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_POOL_RECYCLE'] = 1800  # Recycle connection pool every 30 minutes
app.config['SQLALCHEMY_ENGINE_OPTIONS'] = {
    'connect_args': {'timeout': 10}  # Timeout duration for SQLite
}

# new method for SQLAlchemy from version 3 onwards
with app.app_context():
    db.init_app(app)
    from .models import Login
    db.create_all()
    db.session.commit()
    print('Created Database!')

from application import routes