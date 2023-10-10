import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  List<String> searchResults = []; // Store search results
  List<String> products = [];

  List<Product> cartItems = [];

  // Define categories and their products
  List<Category> categories = [
    Category(
      name: 'Hand & Body Care',
      products: [
        Product(name: 'Lux Soap', price: 500.0),
        Product(name: 'Vaseline', price: 1000.0),
        Product(name: 'Dettol Handwash ', price: 1000.0),
        // Add more products for this category
      ],
    ),
    Category(
      name: 'Diary Products',
      products: [
        Product(name: 'Fresh Milk', price: 20.0),
        Product(name: 'Cheese', price: 50.0),
        Product(name: 'Yoghurt' , price: 78.0)
        // Add more products for this category
      ],
    ),

    Category(
      name: 'Vegetables',
      products: [
        Product(name: 'Beans', price: 20.0),
        Product(name: 'Leaks', price: 50.0),
        Product(name: 'Carrot', price: 50.0),
        // Add more products for this category
      ],
    ),
    // Add more categories with their products
  ];

  @override
  void initState() {
    super.initState();
    // Extract the name part of the email address
    userName = extractNameFromEmail(widget.userEmail);
    getRecommendations(widget
        .userEmail); // Fetch recommendations when the user enters the page
    // Load products from the 'assets/products.txt' file
    loadProducts();
  }

  Future<void> loadProducts() async {
    final productsData = await rootBundle.loadString('assets/products.txt');
    final lines = productsData.split('\n');
    products = lines.map((line) => line.trim()).toList();
  }

  Future<void> getRecommendations(String userEmail) async {
    final Uri uri = Uri.parse(
        'http://52.221.196.140:5650/history_based_recommendation_model');
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

  void performSearch(String query) {
    if (query.isEmpty) {
      // If the search query is empty, clear the search results
      searchResults.clear();
    } else {
      searchResults = products
          .where(
              (product) => product.toLowerCase().contains(query.toLowerCase()))
          .toList();

      // Sort the search results based on relevance (how closely they match the query)
      searchResults.sort((a, b) {
        int relevanceA = a.toLowerCase().split(query.toLowerCase()).length;
        int relevanceB = b.toLowerCase().split(query.toLowerCase()).length;
        return relevanceB.compareTo(relevanceA);
      });

      // Limit the results to the top 5 suggestions
      searchResults = searchResults.take(5).toList();
    }

    setState(() {});
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
                  onChanged: (query) {
                    performSearch(query);
                  },
                  decoration: InputDecoration(
                      hintText: 'Search for product',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0))),
                ),
              ),
              if (searchResults.isNotEmpty)
                Container(
                  color: Colors
                      .white, // Set the background color to a different color
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: searchResults
                        .map(
                          (result) => GestureDetector(
                        onTap: () {
                          setState(() {
                            cartItems.add(
                              Product(name: result, price: 10.0),
                            );
                            searchController.clear();
                            searchResults.clear();
                          });
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Center(
                            child: Text(result), // Display search result
                          ),
                          color: Colors.blue[
                          200], // Match the background color of recommended products
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ),

              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Recommended Products",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 25, 63, 230),
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
                            cartItems.add(Product(
                                name: recommendations[index], price: 10.0));
                          });
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Center(
                            child: Text(
                              recommendations[index],
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ), // Display recommendation
                          ),
                          color: Color.fromARGB(255, 103, 244, 173),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Display category-wise product lists
              for (var category in categories)
                CategoryProductList(
                  category: category,
                  onAddToCart: (Product product) {
                    setState(() {
                      cartItems.add(product);
                    });
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryProductList extends StatelessWidget {
  final Category category;
  final Function(Product) onAddToCart;

  CategoryProductList({required this.category, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            category.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 25, 63, 230),
            ),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: category.products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final product = category.products[index];
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: 120,
                height: 120,
                margin: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    onAddToCart(product);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Center(
                      child: Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    color: Color.fromARGB(255, 103, 244, 173),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Category {
  final String name;
  final List<Product> products;

  Category({required this.name, required this.products});
}


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
