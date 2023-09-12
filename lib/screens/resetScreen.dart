import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// 1. Password Reset Request Screen
class PasswordResetRequestScreen extends StatefulWidget {
  @override
  _PasswordResetRequestScreenState createState() => _PasswordResetRequestScreenState();
}
class _PasswordResetRequestScreenState extends State<PasswordResetRequestScreen> {
  final emailController = TextEditingController();
  final String baseUrl = 'http://your_backend_url_here';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Request Password Reset')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            ElevatedButton(
              child: Text('Request Password Reset'),
              onPressed: () async {
                final response = await http.post(
                  Uri.parse('$baseUrl/forgot-password'),
                  body: jsonEncode({'email': emailController.text}),
                  headers: {'Content-Type': 'application/json'},
                );
                if (response.statusCode == 200) {
                  // Handle success (e.g., navigate to another screen or show a message)
                } else {
                  // Handle error
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
// 2. Password Reset Screen
class PasswordResetScreen extends StatefulWidget {
  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}
class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final String baseUrl = 'http://your_backend_url_here';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: newPasswordController,
              decoration: InputDecoration(labelText: 'New Password'),
              obscureText: true,
            ),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            ElevatedButton(
              child: Text('Reset Password'),
              onPressed: () async {
                if (newPasswordController.text == confirmPasswordController.text) {
                  final response = await http.post(
                    Uri.parse('$baseUrl/reset-password'),
                    body: jsonEncode({'password': newPasswordController.text}),
                    headers: {'Content-Type': 'application/json'},
                  );
                  if (response.statusCode == 200) {
                    // Handle success (e.g., navigate to another screen or show a message)
                  } else {
                    // Handle error
                  }
                } else {
                  // Show password mismatch error
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}