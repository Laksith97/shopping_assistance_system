import 'package:flutter/material.dart';

class previousOrders extends StatefulWidget {
  const previousOrders({super.key});

  @override
  State<previousOrders> createState() => _previousOrdersState();
}

class _previousOrdersState extends State<previousOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previous Orders'),
        backgroundColor: Color.fromARGB(255, 219, 66, 173),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Previous Orders'),
      ),
    );
  }
}
