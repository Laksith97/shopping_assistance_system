// 1. Password Reset Request Screen
import 'package:flutter/material.dart';
import 'your_http_service.dart';  // Import your HTTP service
class PasswordResetRequestScreen extends StatefulWidget {
  @override
  _PasswordResetRequestScreenState createState() => _PasswordResetRequestScreenState();
}
class _PasswordResetRequestScreenState extends State<PasswordResetRequestScreen> {
  final emailController = TextEditingController();
  final httpService = YourHttpService();
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
                // Make request to backend
                final response = await httpService.requestPasswordReset(emailController.text);
                if (response.success) {
                  // Navigate or show success message
                } else {
                  // Show error message
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
  final httpService = YourHttpService();
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
                  // Make request to backend
                  final response = await httpService.resetPassword(newPasswordController.text);
                  if (response.success) {
                    // Navigate or show success message
                  } else {
                    // Show error message
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