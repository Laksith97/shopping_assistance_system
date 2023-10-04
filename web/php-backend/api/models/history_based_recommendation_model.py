import mysql.connector
import csv
from flask import Flask, request, jsonify
import pandas as pd

app = Flask(__name__)

# AWS RDS MySQL database connection settings
db_config = {
    'user': 'admin',
    'password': 'SSASapp23',
    'host': 'shopping-app-db.cmblrafd76se.eu-north-1.rds.amazonaws.com',
    'database': 'shopping_app_db',
}

# Connect to the AWS RDS MySQL database
conn = mysql.connector.connect(**db_config)
cursor = conn.cursor()

# Define a function to generate recommendations based on user email
def generate_recommendations(user_email):
    # Retrieve the user ID from the users table
    cursor.execute(f"SELECT User_id FROM users WHERE Email = '{user_email}'")
    user_id = cursor.fetchone()[0]  # User_id is the first column in the result

    query = f"SELECT User_id, product_name FROM userSearchesproduct, product WHERE userSearchesproduct.product_id = product.product_id AND userSearchesproduct.User_id = '{user_id}';"
    cursor.execute(query)
    result_set = cursor.fetchall()

    # Count how often each user has searched for each product
    data = pd.DataFrame(result_set, columns=['user_id', 'searched_product'])
    product_counts = data.groupby(['user_id', 'searched_product']).size().reset_index(name='counts')

    # Identify the top 5 products for the user
    top_5_products = product_counts.groupby('user_id', group_keys=False).apply(lambda grp: grp.nlargest(5, 'counts')).reset_index(drop=True)

    recommendations = top_5_products['searched_product'].tolist()

    # Save user history to a CSV file
    data.to_csv('user_history.csv', index=False)

    return recommendations


@app.route('/history_based_recommendation_model', methods=['POST'])
def history_based_recommendation_model():
    data = request.get_json()
    user_email = data['email']
    recommendations = generate_recommendations(user_email)
    if recommendations:
        return jsonify({'recommendations': recommendations})
    else:
        return jsonify({'recommendations': []})


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5601, debug=True)

