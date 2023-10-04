import pymysql

host = 'shopping-app-db.cmblrafd76se.eu-north-1.rds.amazonaws.com'
db_name = 'shopping_app_db'
user = 'admin'
password = 'SSASapp23'
charset = 'utf8mb4'

try:
    connection = pymysql.connect(host=host,
                                 user=user,
                                 password=password,
                                 database=db_name,
                                 charset=charset,
                                 cursorclass=pymysql.cursors.DictCursor)

    print("Connection Successful!")

    

except Exception as e:
    print(f"Connection Failed: {e}")

finally:
    if connection:
        connection.close()
