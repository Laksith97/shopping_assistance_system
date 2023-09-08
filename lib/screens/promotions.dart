import 'package:flutter/material.dart';

class Promotions extends StatefulWidget {
  const Promotions({super.key});

  @override
  State<Promotions> createState() => _PromotionsState();
}

class _PromotionsState extends State<Promotions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotions'),
        backgroundColor: Color(0xFF1DB274),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Promotions'),
      ),
    );
  }
}
