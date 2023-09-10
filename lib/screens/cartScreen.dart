import 'package:flutter/material.dart';
import 'package:shopping_assistance_system/screens/productScreen.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartItems;

  CartScreen({required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Map to track item counts in the cart
  final Map<Product, int> itemCountMap = {};

  @override
  void initState() {
    super.initState();
    // Initialize item counts based on the items in the cart
    for (final item in widget.cartItems) {
      itemCountMap[item] = 1; // Initial count is 1
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Color(0xFF076476),
      ),
      body: Center(
        child: widget.cartItems.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    size: 100.0,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Continue Shopping'),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  final item = widget.cartItems[index];
                  final itemCount = itemCountMap[item] ?? 0; // Get item count

                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(15.0), // Adjust padding as needed
                      child: ListTile(
                        title: Text(
                          item.name,
                          style: TextStyle(
                            fontSize: 20.0, // Increase text size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle, // Circular shape
                                color:
                                    Colors.red, // Set color for remove button
                              ),
                              child: IconButton(
                                icon: Icon(Icons.remove),
                                color: Colors.white, // Text color
                                iconSize: 18.0, // Reduce button size
                                onPressed: () {
                                  // Decrease item count
                                  setState(() {
                                    if (itemCount > 1) {
                                      itemCountMap[item] = itemCount - 1;
                                    }
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 10), // Add spacing
                            Text(
                              '$itemCount',
                              style: TextStyle(
                                fontSize: 16.0, // Increase text size
                              ),
                            ), // Show item count
                            SizedBox(width: 10), // Add spacing
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle, // Circular shape
                                color: Colors.green, // Set color for add button
                              ),
                              child: IconButton(
                                icon: Icon(Icons.add),
                                color: Colors.white, // Text color
                                iconSize: 20.0, // Reduce button size
                                onPressed: () {
                                  // Increase item count
                                  setState(() {
                                    itemCountMap[item] = itemCount + 1;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: () {
                            setState(() {
                              // Remove item from cart when count is 0
                              if (itemCount == 1) {
                                widget.cartItems.remove(item);
                                itemCountMap.remove(item);
                              } else if (itemCount > 1) {
                                itemCountMap[item] = itemCount - 1;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
