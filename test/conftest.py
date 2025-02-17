import pytest
from application import create_app, db
from werkzeug.security import generate_password_hash
from application.models import Login
from sqlalchemy import text

# Create and configure a test app
@pytest.fixture(scope='module')
def test_app():
    """Fixture to set up and tear down the test application."""
    
    # Create test app with test-specific config
    app = create_app({
        'TESTING': True,  # Make sure to enable testing mode
        'SQLALCHEMY_DATABASE_URI': "sqlite:///:memory:",  # In-memory DB for tests
        'WTF_CSRF_ENABLED': False,
        'SERVER_NAME': 'localhost',  # Add this line to specify the server name
        'APPLICATION_ROOT': '/',
        'PREFERRED_URL_SCHEME': 'http'
    })

    # Initialize test database
    with app.app_context():
        db.create_all()  # Create all tables in the in-memory database
        db.session.execute(text('PRAGMA foreign_keys=ON;'))  
        yield app  # Provide the app for testing
        db.session.remove()  # Clean up the session
        db.drop_all()  # Drop all tables after tests


# Provide a test client to simulate HTTP requests
@pytest.fixture(scope='module')
def test_client(test_app):
    """Fixture to provide a test client."""
    return test_app.test_client()

# Provide a test runner to run CLI commands
@pytest.fixture(scope='module')
def runner(test_app):
    """Fixture to provide a test runner."""
    return test_app.test_cli_runner()

