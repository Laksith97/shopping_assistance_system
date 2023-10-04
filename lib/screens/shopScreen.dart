import 'package:flutter/material.dart';
import 'package:shopping_assistance_system/screens/cartScreen.dart';
import 'package:shopping_assistance_system/screens/productScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ShopScreen extends StatefulWidget {
  final String userEmail; // To store the user's email

  const ShopScreen({Key? key, required this.userEmail}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearchVisible = true;
  int tappedIndex = -1;
  String userName = '';
  List<String> recommendations = []; // Store product recommendations

  @override
  void initState() {
    super.initState();
    // Extract the name part of the email address
    userName = extractNameFromEmail(widget.userEmail);
    getRecommendations(widget
        .userEmail); // Fetch recommendations when the user enters the page
  }

  Future<void> getRecommendations(String userEmail) async {
    final Uri uri = Uri.parse(
        'http://43.205.254.104:5601/history_based_recommendation_model');
    final Map<String, String> requestData = {'email': userEmail};

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestData),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        recommendations = List<String>.from(data['recommendations']);
      });
    } else {
      print('Failed to fetch recommendations.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Shop'),
        backgroundColor: Color(0xFF0C8E81),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartScreen(cartItems: cartItems)),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('\nWelcome, $userName!'), // Display the user's name
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      hintText: 'Search for product',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0))),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Recommended Products",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3153EB),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount:
                      recommendations.length, // Using recommendations count
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: tappedIndex == index ? 120 : 100,
                      height: tappedIndex == index ? 120 : 100,
                      margin: EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            tappedIndex = index;
                            cartItems.add(
                                Product(name: "Product $index", price: 10.0));
                          });
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Center(
                            child: Text(recommendations[
                                index]), // Display recommendation
                          ),
                          color: Colors.green[700],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Product> cartItems = [];

String extractNameFromEmail(String email) {
  if (email.contains('@')) {
    // Split the email address at the "@" symbol
    List<String> parts = email.split('@');

    // The first part (parts[0]) is the name
    return parts[0];
  } else {
    // If the email doesn't contain "@", return the full email
    return email;
  }
}
