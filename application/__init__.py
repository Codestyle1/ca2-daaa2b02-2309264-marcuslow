from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

# Instantiate the LoginManager
login_manager = LoginManager()

# Instantiate SQLAlchemy
db = SQLAlchemy()

def create_app(config=None):
    app = Flask(__name__)

    # Default configurations
    app.config.from_mapping(
        SECRET_KEY=os.getenv('SECRET_KEY', 'default_secret_key'),
        SQLALCHEMY_TRACK_MODIFICATIONS=False,
        SQLALCHEMY_POOL_RECYCLE=1800
    )

    # Load environment-specific settings
    flask_env = os.getenv('FLASK_ENV', 'development')
    if flask_env == 'development':
        app.config.from_pyfile('config.cfg')  # Load development config
        app.config['SQLALCHEMY_DATABASE_URI'] = "sqlite:///database.db"
    
    # Override with provided config (for testing)
    if config:
        app.config.update(config)

    # Initialize the database
    db.init_app(app)

    # Initialize the login manager
    login_manager.init_app(app)  # Initialize with the app

    # Set the login view (redirect to the login page if not authenticated)
    login_manager.login_view = 'routes.login'  # Set the login route name
    login_manager.login_message = "Please log in to access this page."

    # Define the user loader function
    from application.models import Login  # Import your User model here to avoid circular imports
    @login_manager.user_loader
    def load_user(user_id):
        return Login.query.get(int(user_id))

    # Import routes after app is initialized to avoid circular imports
    from application.routes import routes_bp  # Import Blueprint
    app.register_blueprint(routes_bp)  # Register the Blueprint

    return app

# Only initialize the database if running in development
if os.getenv('FLASK_ENV', 'development') == 'development':
    app = create_app()
    with app.app_context():
        from application.models import Login  # Import models here to avoid circular import
        db.create_all()  # Create all tables if they don't exist
        db.session.commit()
        print('Development database initialized!')
