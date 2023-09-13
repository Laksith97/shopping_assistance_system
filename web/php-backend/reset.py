from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
import pymysql
from werkzeug.security import generate_password_hash, check_password_hash
import jwt
from datetime import datetime, timedelta

app = Flask(__name__)

# Configurations
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://admin:SSASapp23@shopping-app-db.cmblrafd76se.eu-north-1.rds.amazonaws.com/shopping_app_db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SECRET_KEY'] = '65cae3657c3eeef94a7db672440de77353f075e946e5cc30'

# Initialize SQLAlchemy with Flask app
db = SQLAlchemy(app)

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password = db.Column(db.String(120), nullable=False)
    reset_token = db.Column(db.String(200))

@app.route('/reset_password', methods=['POST'])
def reset_password():
    data = request.get_json()
    email = data['email']
    new_password = data['new_password']

    user = User.query.filter_by(email=email).first()

    if not user:
        return jsonify({'message': 'User not found!'}), 404

    user.password = generate_password_hash(new_password, method='sha256')
    user.reset_token = None
    db.session.commit()

    return jsonify({'message': 'Password updated successfully!'}), 200

# Assuming other endpoints here (e.g. login, register)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5300, debug=True)
