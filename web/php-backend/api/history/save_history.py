from flask import Flask, request, jsonify
import mysql.connector
from datetime import datetime

app = Flask(__name__)

# AWS RDS MySQL configuration
db_config = {
    'host': 'shopping-app-db.cmblrafd76se.eu-north-1.rds.amazonaws.com',
    'user': 'admin',
    'password': 'SSASapp23',
    'database': 'shopping_app_db'
}

@app.route('/save_history', methods=['POST'])
def save_history():
    data = request.get_json()
    user_email = data['userEmail']
    cart_items = data['cartItems']

    # Connect to the MySQL database
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()

    # Get the User_id from the users table based on the email
    cursor.execute("SELECT User_id FROM users WHERE Email = %s", (user_email,))
    user_id = cursor.fetchone()[0]

    # Get the current date and time
    current_date = datetime.now().date()
    current_time = datetime.now().time()

    # Insert each cart item into the history table with date and time
    for item in cart_items:
        cursor.execute("INSERT INTO history (User_id, searched_item, searched_date, searched_time) VALUES (%s, %s, %s, %s)",
                       (user_id, item, current_date, current_time))
        conn.commit()

    cursor.close()
    conn.close()

    return jsonify({'message': 'Data saved successfully'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5650, debug=True)
