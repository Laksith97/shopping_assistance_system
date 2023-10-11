import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_assistance_system/screens/mapScreen.dart';
import 'dart:convert';

import 'package:shopping_assistance_system/screens/productScreen.dart';

class ShopInfoScreen extends StatefulWidget {
  final Map<String, dynamic> shopInfo;
  final List<Product> cartItems;
  final String selectedTravelMode;

  ShopInfoScreen(
      {required this.shopInfo,
      required this.cartItems,
      required this.selectedTravelMode});

  @override
  _ShopInfoScreenState createState() => _ShopInfoScreenState();
}

class _ShopInfoScreenState extends State<ShopInfoScreen> {
  List<Map<String, dynamic>> _shopInfoList = [];

  Future<void> _loadShopInfo() async {
    final List<Product> cartItems = widget.cartItems;
    final double userLatitude = 8.3531; // Actual user latitude
    final double userLongitude = 80.5022; // Actual user longitude
    final String selectedTravelMode = widget.selectedTravelMode;

    final response = await ShopInfoLoader().fetchShopInfo(
        userLatitude,
        userLongitude,
        cartItems.map((item) => item.name).toList(),
        selectedTravelMode);

    setState(() {
      _shopInfoList = response;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadShopInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _shopInfoList.length,
          itemBuilder: (context, index) {
            final shopInfo = _shopInfoList[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Shop Name: ${shopInfo['Shop Name'] ?? 'Loading...'}'),
                Text('Distance: ${shopInfo['Distance'] ?? 'Loading...'}'),
                Text(
                    'Number of Available Items: ${shopInfo['Number of Available Items'] ?? 'Loading...'}'),
                // Add more Text widgets for other details...
              ],
            );
          },
        ),
      ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => MapPage(),
              ));
            },
            child: Text('Search Path'),
          ),
        ),
    );
  }
}

class ShopInfoLoader {
  Future<List<Map<String, dynamic>>> fetchShopInfo(double userLatitude,
      double userLongitude, List<String> itemNames, String travelMode) async {
    final response = await http.post(
      // Replace with your server's URL
      Uri.parse('http://18.142.249.120:5000/optimizing_model'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user_latitude': userLatitude,
        'user_longitude': userLongitude,
        'item_list': itemNames,
        'travel_mode': travelMode,
      }),
    );

    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> responseData =
          List<Map<String, dynamic>>.from(json.decode(response.body));
      return responseData;
    } else {
      throw Exception('Failed to load shop info');
    }
  }
}
