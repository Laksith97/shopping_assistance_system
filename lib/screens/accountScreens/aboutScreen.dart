import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Color.fromARGB(255, 43, 19, 182),
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0x769CC0AB), Colors.white],
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/developer_image.jpg',
                      width: 300,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Developers Behind the Shopping App',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      shadows: [
                        Shadow(
                          blurRadius:3,
                          color: Colors.black87,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Welcome to the heart and soul of our shopping app - the talented team of developers who turn your digital retail dreams into a seamless and user-friendly reality. We take pride in our commitment to creating a shopping experience that transcends boundaries and exceeds expectations.",
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Our Mission",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Our mission is simple but profound: to innovate, design, and develop shopping apps that not only meet your immediate needs but also anticipate your future desires. We believe in the transformative power of technology to enhance your shopping journey and simplify your life.",
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Team Members",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Laksith Ratnayake\nMalinda Senavirathna\nRavindu Godage\nYohan Perera\nChamod Senarathna",
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  // Add more Text widgets for other sections here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
