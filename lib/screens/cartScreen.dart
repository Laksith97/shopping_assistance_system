import 'package:flutter/material.dart';
import 'package:shopping_assistance_system/screens/productScreen.dart';
import 'package:shopping_assistance_system/screens/mapScreen.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartItems;

  CartScreen({required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final Map<Product, int> itemCountMap = {};

  @override
  void initState() {
    super.initState();
    for (final item in widget.cartItems) {
      itemCountMap[item] = 1;
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapPage()),
                );
              },
              child: Text('Search Path'),
            ),
          ),
        ],
      ),
    );
  }
}
