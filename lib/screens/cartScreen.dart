import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_assistance_system/screens/productScreen.dart';
import 'package:shopping_assistance_system/screens/mapScreen.dart';
import 'package:shopping_assistance_system/screens/shopInfoScreen.dart';
import 'package:shopping_assistance_system/screens/shopScreen.dart';
import 'package:http/http.dart' as http;

class CartScreen extends StatefulWidget {
  final List<Product> cartItems;
  final String userEmail;

  const CartScreen({required this.cartItems, required this.userEmail});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Map<Product, int> itemCountMap = {};
  String selectedTravelMode = "";

  @override
  void initState() {
    super.initState();
    for (final item in widget.cartItems) {
      itemCountMap[item] = 1;
    }
  }

  Future<void> updateHistory() async {
    try {
      // Send a POST request to update the history table.
      final response = await http.post(
        Uri.parse('http://18.142.249.120:5650/save_history'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'userEmail': widget.userEmail,
          'cartItems': widget.cartItems.map((item) => item.name).toList(),
        }),
      );

      if (response.statusCode == 200) {
        print('History updated successfully');
      } else {
        print('Failed to update history');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Color(0xFF076476),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
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
                        final itemCount = itemCountMap[item] ?? 0;

                        return Card(
                          margin: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: ListTile(
                              title: Text(
                                item.name,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.remove),
                                      color: Colors.white,
                                      iconSize: 20.0,
                                      onPressed: () {
                                        setState(() {
                                          if (itemCount > 1) {
                                            itemCountMap[item] = itemCount - 1;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '$itemCount',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.add),
                                      color: Colors.white,
                                      iconSize: 20.0,
                                      onPressed: () {
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
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                await updateHistory();
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Select Travel Mode'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.drive_eta),
                              title: Text('Driving'),
                              onTap: () {
                                setState(() {
                                  selectedTravelMode =
                                      'driving'; // Store the selected mode
                                });
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShopInfoScreen(
                                            shopInfo: {},
                                            cartItems: widget
                                                .cartItems, // Pass cartItems
                                            selectedTravelMode:
                                                selectedTravelMode, // Pass selectedTravelMode
                                          )),
                                );
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.directions_walk),
                              title: Text('On Foot'),
                              onTap: () {
                                setState(() {
                                  selectedTravelMode =
                                      'walking'; // Store the selected mode
                                });
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShopInfoScreen(
                                            shopInfo: {},
                                            cartItems: widget
                                                .cartItems, // Pass cartItems
                                            selectedTravelMode:
                                                selectedTravelMode, // Pass selectedTravelMode
                                          )),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Text('Select Travel Mode'),
            ),
          ),
        ],
      ),
    );
  }
}
