import 'package:flutter/material.dart';

class PreviousOrdersScreen extends StatefulWidget {
  const PreviousOrdersScreen({super.key});

  @override
  State<PreviousOrdersScreen> createState() => _PreviousOrdersScreenState();
}

class _PreviousOrdersScreenState extends State<PreviousOrdersScreen> {
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
