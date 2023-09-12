import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: Color(0xFF4EE50C),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Account'),
      ),
    );
  }
}
