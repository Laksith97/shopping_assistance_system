import 'package:flutter/material.dart';

class languageSupport extends StatefulWidget {
  const languageSupport({super.key});

  @override
  State<languageSupport> createState() => _languageSupportState();
}

class _languageSupportState extends State<languageSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language'),
        backgroundColor: Color.fromARGB(255, 117, 95, 241),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Language'),
      ),
    );
  }
}
