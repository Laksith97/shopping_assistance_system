from flask import Flask, jsonify, request
import mysql.connector
import geopy.distance

app = Flask(__name__)

# Database connection configurations for the main retailer table
main_db_config = {
    'host': 'shopping-app-db.cmblrafd76se.eu-north-1.rds.amazonaws.com',
    'user': 'admin',
    'password': 'SSASapp23',
    'database': 'shopping_app_db',
}

# Database connection configurations for the RetailProducts tables
retail_db_configs = {
    "Miheen Super": {
        'host': 'shopping-app-db.cmblrafd76se.eu-north-1.rds.amazonaws.com',
        'user': 'admin',
        'password': 'SSASapp23',
        'database': 'Miheen_Super',
    },
    "Co-op City": {
        'host': 'shopping-app-db.cmblrafd76se.eu-north-1.rds.amazonaws.com',
        'user': 'admin',
        'password': 'SSASapp23',
        'database': 'Co_op_City',
    },
    "Dinithi Multy Corner": {
        'host': 'shopping-app-db.cmblrafd76se.eu-north-1.rds.amazonaws.com',
        'user': 'admin',
        'password': 'SSASapp23',
        'database': 'Dinithi_Multy_Corner',
    },
}

def get_retailers():
    connection = mysql.connector.connect(**main_db_config)
    cursor = connection.cursor()

    query = "SELECT branch_name, retailer_name, latitude, longitude FROM retailer"
    cursor.execute(query)
    retailers = cursor.fetchall()

    retailer_data = []

    for retailer in retailers:
        retailer_name = retailer[1]
        latitude = retailer[2]
        longitude = retailer[3]

        product_data = get_product_data(retailer_name)
        retailer_data.append({
            "name": retailer_name,
            "latitude": latitude,
            "longitude": longitude,
            "items": product_data,
        })

    cursor.close()
    connection.close()

    return retailer_data

def get_product_data(retailer_name):
    connection = mysql.connector.connect(**retail_db_configs[retailer_name])
    cursor = connection.cursor()

    query = "SELECT Item_Name, Unit_Cost, Number_in_stock FROM RetailProducts"
    cursor.execute(query)
    products = cursor.fetchall()

    product_data = []
    for product in products:
        item_name = product[0]
        price = product[1]
        count = product[2]

        product_data.append({
            "name": item_name,
            "price": price,
            "count": count,
        })

    cursor.close()
    connection.close()

    return product_data

@app.route('/optimizing_model', methods=['POST'])
def optimizing_model():
    data = request.get_json()
    user_latitude = data['user_latitude']
    user_longitude = data['user_longitude']
    item_list = data['item_list']
    travel_mode = data['travel_mode']

    # Retrieve retailer data
    retailer_data = get_retailers()

    # Define weights for different criteria
    distance_weight = 0.4  # Priority to distance
    num_items_weight = 0.6  # Priority to item count
    total_price_weight = 0.0  # No priority to total price

    # Define search radius based on travel mode
    if travel_mode == "walking":
        search_radius_km = 1.0  # 1 km radius for walking
    elif travel_mode == "driving":
        search_radius_km = 5.0  # 5 km radius for driving

    user_location = (user_latitude, user_longitude)

    # Initialize a dictionary to store shop information
    shop_info = {}

    # Initialize dictionaries to count available and not available items for each shop
    available_counts = {shop["name"]: {item: 0 for item in item_list} for shop in retailer_data}
    not_available_counts = {shop["name"]: 0 for shop in retailer_data}

    # Function to find the cheapest item among available items
    def find_cheapest_item(available_items):
        if not available_items:
            return None
        cheapest_item = min(available_items, key=lambda x: x["price"])
        return cheapest_item

    # Function to find available items in a shop
    def find_available_items(shop, item_list):
        available_items = []
        not_available_items = []
        total_price = 0  # Initialize total price for available items
        for item in item_list:
            for shop_item in shop["items"]:
                if item == shop_item["name"] and shop_item["count"] > 0:
                    available_items.append({
                        "name": item,
                        "price": shop_item["price"]
                    })
                    total_price += shop_item["price"]  # Add item price to total
                    shop_item["count"] -= 1  # Decrement the count
                    break  # Break the inner loop after finding the item
            else:
                not_available_items.append(item)  # Item is not available
        return available_items, not_available_items, total_price

    # Iterate through the retailer database and find available items
    for shop in retailer_data:
        shop_location = (shop["latitude"], shop["longitude"])
        distance = geopy.distance.distance(user_location, shop_location).km

        if distance <= search_radius_km:
            available_items, not_available_items, total_price = find_available_items(shop, item_list)

            if available_items:
                cheapest_item = find_cheapest_item(available_items)

                # Convert total_price to float
                total_price = float(total_price)
                
                shop_info[shop["name"]] = {
                    "distance_km": distance,
                    "num_available_items": len(available_items),
                    "total_price": total_price,
                    "combined_score": (
                        distance_weight * distance +
                        num_items_weight * len(available_items) +
                        total_price_weight * total_price
                    ),
                    "available_items": available_items,  # Include available items with details
                    "not_available_items": not_available_items,  # Include not available items
                    "cheapest_item": cheapest_item,
                    "latitude": shop["latitude"],
                    "longitude": shop["longitude"],
                }

                for available_item in available_items:
                    available_counts[shop["name"]][available_item["name"]] += 1  # Increment available count
                not_available_counts[shop["name"]] += len(not_available_items)  # Increment not available count

    # Sort shops based on the combined score in descending order
    sorted_shops = sorted(shop_info.items(), key=lambda x: (x[1]["num_available_items"], x[1]["distance_km"]), reverse=True)

    # Prepare the response data
    optimized_shops = []
    for shop_name, info in sorted_shops:
        shop_info = {
            "Shop Name": shop_name,
            "Distance": f"{info['distance_km']} km",
            "Number of Available Items": info['num_available_items'],
            "Total Price of Available Items": f"{info['total_price']:.2f}",
            "Available Items": [{"Item": item['name'], "Price": item['price']} for item in info['available_items']],
            "Not Available Items": info['not_available_items'],
            "Cheapest Available Item": {"Item": info['cheapest_item']['name'], "Price": info['cheapest_item']['price']},
            "Available Item Counts": [{"Item": item, "Count": count} for item, count in available_counts[shop_name].items()],
            "Not Available Item Count": not_available_counts[shop_name],
            "Coordinates": {"Latitude": shop['latitude'], "Longitude": shop['longitude']}
        }
        optimized_shops.append(shop_info)

    return jsonify(optimized_shops)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)


