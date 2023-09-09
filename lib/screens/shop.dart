import 'package:flutter/material.dart';
import 'package:shopping_assistance_system/screens/cart.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  TextEditingController searchController = TextEditingController();
  bool isSearchVisible = true;
  int tappedIndex = -1;

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
              // Add your cart functionality here
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        // Adding ListView for recommended products
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Adding Text Field for Search products
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
                    color: Color.fromARGB(255, 49, 83, 235),
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
                          // Handle the tap operation for the selected item here
                          setState(() {
                            tappedIndex = index;
                          });
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            // Adjust the radius as needed
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
