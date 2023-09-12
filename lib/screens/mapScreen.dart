import 'package:flutter/material.dart';

class mapScreen extends StatefulWidget {
  const mapScreen({super.key});

  @override
  State<mapScreen> createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
        backgroundColor: Color.fromARGB(255, 238, 43, 59),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Account'),
      ),
    );
  }
}
