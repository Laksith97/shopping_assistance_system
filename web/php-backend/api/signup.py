from flask import Flask, request, jsonify
import pymysql

app = Flask(_name_)

def get_db_connection():
    connection = pymysql.connect(host='shopping-app-db.cmblrafd76se.eu-north-1.rds.amazonaws.com',
                                 user='admin',
                                 password='SSASapp23',
                                 db='shopping_app_db',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)
    return connection

@app.route('/signup', methods=['POST'])
def signup():
    name = request.form.get('name')
    password = request.form.get('password')
    email = request.form.get('email')
    
    connection = get_db_connection()
    
    try:
        with connection.cursor() as cursor:
            # Check if user already exists
            sql = "SELECT * FROM users WHERE Name = %s AND Password = %s AND Email = %s"
            cursor.execute(sql, (name, password, email))
            result = cursor.fetchall()
            
            if len(result) == 1:
                return jsonify("Error"), 400
            else:
                # Insert the new user
                sql = "INSERT INTO users (Name, Password, Email) VALUES (%s, %s, %s)"
                cursor.execute(sql, (name, password, email))
                connection.commit()
                return jsonify("Success"), 201

    finally:
        connection.close()

if _name_ == "_main_":
    app.run(debug=True)