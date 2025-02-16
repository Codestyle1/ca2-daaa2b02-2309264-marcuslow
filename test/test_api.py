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