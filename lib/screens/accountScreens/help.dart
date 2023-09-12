import 'package:flutter/material.dart';

class help extends StatefulWidget {
  const help({super.key});

  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
        backgroundColor: Color.fromARGB(255, 48, 216, 124),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Help'),
      ),
    );
  }
}
