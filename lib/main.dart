import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopping_assistance_system/routes/routes.dart';
import 'package:shopping_assistance_system/screens/welcome_screen.dart';

// void main() {
//   runApp(GetMaterialApp(
//     debugShowCheckedModeBanner: false,
//     initialRoute: AppPage.getnavbar(),
//     getPages: AppPage.routes,
//   ));
// }

void main() {
  runApp(const MyApp());
  //initializeApp();
}

// void initializeApp() {
//   runApp(GetMaterialApp(
//     debugShowCheckedModeBanner: false,
//     initialRoute: AppPage.getnavbar(),
//     getPages: AppPage.routes,
//   ));
// }

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
