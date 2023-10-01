import 'package:flutter/material.dart';
import 'package:shopping_assistance_system/screens/cartScreen.dart';
import 'package:shopping_assistance_system/screens/productScreen.dart';

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

  @override
  void initState() {
    super.initState();
    // Extract the name part of the email address
    userName = extractNameFromEmail(widget.userEmail);
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
                  itemCount: 5,
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
                            child: Text("Card $index"),
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
