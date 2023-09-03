import 'package:flutter/material.dart';
import 'package:shopping_assistance_system/navbar/navbar.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Color(0xFF076476),
      ),
      body: Center(
        child: Column(
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
                // Add functionality to navigate back to the shop or do something else
                Navigator.push
                  (context,
                    MaterialPageRoute(builder: (context) => NavBar()),
                );
              },
              child: Text('Continue Shopping'),
            ),
          ],
        ),
      ),
    );
  }
}
