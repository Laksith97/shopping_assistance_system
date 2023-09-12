import 'package:flutter/material.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Color.fromARGB(255, 43, 19, 182),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('About Us'),
      ),
    );
  }
}
