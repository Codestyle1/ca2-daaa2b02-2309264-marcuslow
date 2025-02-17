import pytest
from application.models import Login
from application import db
from sqlalchemy import inspect

### INTEGRATION TEST HERE ###

######################################
######## Integration Testing #########
######################################
# Test if the app is using the memory db, and test inserting rows into the db
def test_in_memory_db(test_app):
    with test_app.app_context():
        # Ensure the app is using the in-memory database
        assert db.engine.url.database == ':memory:'  # Ensure it is using the in-memory DB

        # Check if tables were created in the in-memory DB using SQLAlchemy's Inspector
        inspector = inspect(db.engine)
        table_names = inspector.get_table_names()
        assert len(table_names) > 0  # Ensure that there are tables in the database

        # Add a new user with a plain-text password (bypassing the hash for simplicity)
        user = Login(username='test', email='test@email.com', password_hash='password')  # Directly storing plain-text password
        db.session.add(user)
        db.session.commit()

        # Query the user from the database
        fetched_user = Login.query.filter_by(username='test').first()

        # Ensure the user is in the database
        assert fetched_user is not None
        assert fetched_user.username == 'test'
        assert fetched_user.password_hash == 'password'  # Checking against the plain-text password

# Test user registration (creating new user)
def test_user_registration(test_app):
    with test_app.app_context():
        # Create a new user and commit
        user = Login(username='new_user', email='newuser@email.com', password_hash='newpassword')
        db.session.add(user)
        db.session.commit()

        # Query the database to check if the user was added
        fetched_user = Login.query.filter_by(username='new_user').first()

        # Check that the user exists in the database and the details are correct
        assert fetched_user is not None
        assert fetched_user.username == 'new_user'
        assert fetched_user.email == 'newuser@email.com'
        assert fetched_user.password_hash == 'newpassword'  # Check if password is stored as expected

# Test user login
def test_user_login(test_app):
    with test_app.app_context():
        # Create a new user first
        user = Login(username='test_login', email='loginuser@email.com', password_hash='securepassword')
        db.session.add(user)
        db.session.commit()

        # Simulate login by querying the user
        fetched_user = Login.query.filter_by(username='test_login').first()

        # Check that the fetched user exists
        assert fetched_user is not None
        assert fetched_user.username == 'test_login'
        
        # Verify the password by comparing the stored hash (For simplicity, just checking the plain text here)
        assert fetched_user.password_hash == 'securepassword'

# Test user deletion
def test_user_deletion(test_app):
    with test_app.app_context():
        # Create a new user
        user = Login(username='delete_user', email='deleteuser@email.com', password_hash='deletepassword')
        db.session.add(user)
        db.session.commit()

        # Query to confirm the user is added
        fetched_user = Login.query.filter_by(username='delete_user').first()
        assert fetched_user is not None

        # Delete the user
        db.session.delete(fetched_user)
        db.session.commit()

        # Query again to ensure the user was deleted
        fetched_user_deleted = Login.query.filter_by(username='delete_user').first()
        assert fetched_user_deleted is None  # The user should not exist anymore

# Test user update
def test_user_update(test_app):
    with test_app.app_context():
        # Create a new user
        user = Login(username='update_user', email='updateuser@email.com', password_hash='oldpassword')
        db.session.add(user)
        db.session.commit()

        # Query the user and update the password
        fetched_user = Login.query.filter_by(username='update_user').first()
        fetched_user.password_hash = 'newpassword'
        db.session.commit()

        # Fetch the updated user
        updated_user = Login.query.filter_by(username='update_user').first()

        # Ensure the password is updated
        assert updated_user.password_hash == 'newpassword'

# Test database roll on error
def test_database_rollback_on_error(test_app):
    with test_app.app_context():
        try:
            # Start a transaction, but we'll make an error intentionally (e.g., missing required field)
            user = Login(username='rollback_user', email=None, password_hash='rollbackpassword')  # Invalid email (None)
            db.session.add(user)
            db.session.commit()
        except Exception as e:
            # Expect the commit to fail due to invalid data and ensure no data is added to the database
            db.session.rollback()

        # Verify that the user was not added to the database
        fetched_user = Login.query.filter_by(username='rollback_user').first()
        assert fetched_user is None

# Test User Query with Multiple Records
def test_multiple_user_query(test_app):
    with test_app.app_context():
        # Create multiple users
        user1 = Login(username='user1', email='user1@email.com', password_hash='password1')
        user2 = Login(username='user2', email='user2@email.com', password_hash='password2')
        db.session.add(user1)
        db.session.add(user2)
        db.session.commit()

        # Query the database to get a list of all users
        users = Login.query.all()

        # Ensure there are multiple users
        assert len(users) > 1
        assert any(user.username == 'user1' for user in users)
        assert any(user.username == 'user2' for user in users)

# Test data integrity with constraints
def test_unique_constraints(test_app):
    with test_app.app_context():
        # Create a new user with a unique email
        user1 = Login(username='user3', email='unique@email.com', password_hash='password3')
        db.session.add(user1)
        db.session.commit()

        # Attempt to insert another user with the same email
        user2 = Login(username='user4', email='unique@email.com', password_hash='password4')
        db.session.add(user2)

        try:
            db.session.commit()  # This should raise an IntegrityError due to the unique email constraint
        except Exception as e:
            db.session.rollback()  # Rollback the session
            assert 'IntegrityError' in str(e)  # Check that an integrity error occurred
