import 'package:flutter/material.dart';
import 'package:shopping_assistance_system/components/components.dart';
import 'package:shopping_assistance_system/components/under_part.dart';
import 'package:shopping_assistance_system/screens/screens.dart';
import 'package:shopping_assistance_system/widgets/rounded_name_field.dart';
import 'package:shopping_assistance_system/widgets/widgets.dart';

import 'package:http/http.dart' as http;

import 'dart:async';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  iconButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        RoundedIcon(imageUrl: "assets/images/facebook.png"),
        SizedBox(
          width: 20,
        ),
        RoundedIcon(imageUrl: "assets/images/google.jpg"),
        SizedBox(
          width: 20,
        ),
        RoundedIcon(imageUrl: "assets/images/github.png"),
      ],
    );
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
                  imgUrl: "assets/images/register.png",
                ),
                const PageTitleBar(title: 'Create New Account'),
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
                          key: _formKey,
                          child: Column(
                            children: [
                              RoundedInputField(
                                hintText: "Email",
                                icon: Icons.email,
                                controller: emailController,
                              ),
                              RoundedNameField(
                                hintText: "Name",
                                icon: Icons.person,
                                controller: nameController,
                              ),
                              RoundedPasswordField(
                                controller: passwordController,
                              ),
                              RoundedButton(
                                text: 'REGISTER',
                                press: () async {
                                  if (_formKey.currentState!.validate()) {
                                    String email = emailController.text.trim();
                                    String name = nameController.text.trim();
                                    String password = passwordController.text.trim();

                                    await registerUser(email, name, password);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                    );
                                  }
                                  // Logging values before sending
                                  print(
                                      'Email Controller Value: ${emailController.text}');
                                  print(
                                      'Name Controller Value: ${nameController.text}');
                                  print(
                                      'Password Controller Value: ${passwordController.text}');
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Already have an account?",
                                navigatorText: "Login here",
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
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

  Future<void> registerUser(String email, String name, String password) async {
    final url = 'http://16.171.14.68:5000/signup';

    print('Sending to Server:');
    print('Email: $email');
    print('Name: $name');
    print('Password: $password');

    final response = await http.post(
      Uri.parse(url),
      body: {
        'email': email,
        'name': name,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      print("Response from server: ${response.body}");
    } else {
      print("Registration : ${response.body}");
    }
  }
}
