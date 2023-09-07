import 'package:flutter/material.dart';
import 'package:shopping_assistance_system/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
  //initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const WelcomeScreen(),
    );
  }
}
