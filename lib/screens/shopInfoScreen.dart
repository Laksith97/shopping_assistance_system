import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ShopInfoScreen extends StatefulWidget {
  final Map<String, dynamic> shopInfo;

  ShopInfoScreen({required this.shopInfo});

  @override
  _ShopInfoScreenState createState() => _ShopInfoScreenState();
}

class _ShopInfoScreenState extends State<ShopInfoScreen> {
  Map<String, dynamic> _shopInfo = {};

  @override
  void initState() {
    super.initState();
    ShopInfoLoader().fetchShopInfo().then((shopInfo) {
      setState(() {
        _shopInfo = shopInfo;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Shop Name: ${_shopInfo['Shop Name']}'),
            Text('Distance: ${_shopInfo['Distance']}'),
            Text('Number of Available Items: ${_shopInfo['Number of Available Items']}'),
            // Add more Text widgets for other details...
          ],
        ),
      ),
    );
  }
}

class ShopInfoLoader {
  Future<Map<String, dynamic>> fetchShopInfo() async {
    final response = await http.post(
      'http://18.142.249.120:5000/optimizing_model.py' as Uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user_latitude': 8.3608, // Replace with actual user latitude
        'user_longitude': 80.5033, // Replace with actual user longitude
        'item_list': ['Nice', 'Cream Cracker'], // Replace with actual item list
        'travel_mode': 'walking', // Replace with actual travel mode
      }),
    );

    if (response.statusCode == 200) {
      // If server returns a 200 OK response, parse the JSON
      return json.decode(response.body);
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load shop info');
    }
  }
}