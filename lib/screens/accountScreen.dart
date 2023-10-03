import 'package:flutter/material.dart';
import 'package:shopping_assistance_system/screens/accountScreens/aboutScreen.dart';
import 'package:shopping_assistance_system/screens/accountScreens/helpScreen.dart';
import 'package:shopping_assistance_system/screens/accountScreens/languageSupportScreen.dart';
import 'package:shopping_assistance_system/screens/accountScreens/previousOrdersScreen.dart';
import 'package:shopping_assistance_system/screens/shopScreen.dart';

import 'loginScreen.dart';

class AccountScreen extends StatefulWidget {
  final String userEmail; // To store the user's email

  const AccountScreen({super.key, required this.userEmail});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String userName = '';
  String userEmail = '';
  final String userImageUrl = 'https://example.com/user_image.jpg';

  @override
  void initState() {
    super.initState();
    // Extract the name part of the email address
    userEmail = widget.userEmail;
    userName = extractNameFromEmail(widget.userEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: Color(0xFF4EE50C),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 116, 214, 92).withOpacity(0.2),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(userImageUrl),
                    child: Icon(
                      Icons.person,
                      size: 50,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        userEmail,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                String cardTitle = '';
                switch (index) {
                  case 0:
                    cardTitle = 'Previous Searches';
                    break;
                  case 1:
                    cardTitle = 'About Us';
                    break;
                  case 2:
                    cardTitle = 'Language Support';
                    break;
                  case 3:
                    cardTitle = 'Help & Support';
                    break;
                }

                return GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PreviousOrdersScreen()),
                        );
                        break;
                      case 1:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutScreen()),
                        );
                        break;
                      case 2:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LanguageSupportScreen()),
                        );
                        break;
                      case 3:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactScreen()),
                        );
                        break;
                    }
                  },
                  child: Card(
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(cardTitle),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
