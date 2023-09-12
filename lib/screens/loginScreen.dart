import 'package:flutter/material.dart';
import 'package:shopping_assistance_system/components/components.dart';
import 'package:shopping_assistance_system/components/under_part.dart';
import 'package:shopping_assistance_system/constants.dart';
import 'package:shopping_assistance_system/navbar/navbar.dart';
import 'package:shopping_assistance_system/screens/screens.dart';
import 'package:shopping_assistance_system/widgets/widgets.dart';
import 'package:http/http.dart' as http; // Import the http package for making HTTP requests
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginUser(String email, String password) async {
    final url = 'http://16.171.14.68:5100/login.py';

    final response = await http.post(
      Uri.parse(url),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Successful login
      // You can handle the response data here, e.g., storing tokens, navigating to home screen, etc.
      final responseData = json.decode(response.body);
      // Example: Store the user token in a shared preference or state management
      // final token = responseData['token'];
      // Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar()));
    } else {
      // Handle login failure
      final errorMessage = json.decode(response.body)['message'];
      // You can show an error message to the user
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Upside(
                  imgUrl: "assets/images/login.png",
                ),
                const PageTitleBar(title: 'Login to your account'),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        iconButton(context),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "or use your email account",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'OpenSans',
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                        Form(
                          child: Column(
                            children: [
                              RoundedInputField(
                                hintText: "Email",
                                icon: Icons.email,
                                controller: emailController,
                              ),
                              RoundedPasswordField(
                                controller: passwordController,
                              ),
                              switchListTile(),
                              RoundedButton(
                                text: 'LOGIN',
                                press: () async {
                                  String email = emailController.text.trim();
                                  String password = passwordController.text.trim();

                                  // Call the loginUser function to perform login
                                  await loginUser(email, password);
                                },
                              ),
                              UnderPart(
                                title: "Don't have an account?",
                                navigatorText: "Register here",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const SignUpScreen()),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Forgot password?',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

// The rest of your functions (iconButton and switchListTile) remain unchanged
}
