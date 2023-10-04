from flask import Flask, request, jsonify
import pymysql

app = Flask(__name__)

def get_db_connection():
    connection = pymysql.connect(
        host='shopping-app-db.cmblrafd76se.eu-north-1.rds.amazonaws.com',
        user='admin',
        password='SSASapp23',
        db='shopping_app_db',
        charset='utf8mb4'
    )
    return connection

@app.route('/login', methods=['POST'])
def login():
    email = request.form.get('email')
    password = request.form.get('password')

    connection = get_db_connection()
    cursor = connection.cursor()

    try:
        # Check if the email exists
        sql = "SELECT Password FROM users WHERE Email=%s"
        cursor.execute(sql, (email,))
        result = cursor.fetchone()

        if result:
            if result[0] == password:
                return jsonify({"status": "Success", "message": "Login successful"}), 200
            else:
                return jsonify({"status": "Error", "message": "Incorrect email or password"}), 401
        else:
            return jsonify({"status": "Error", "message": "Incorrect email or password"}), 401
    finally:
        cursor.close()
        connection.close()




if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5101, debug=True)
