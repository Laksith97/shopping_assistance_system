import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:shopping_assistance_system/controller/controller.dart';
import 'package:shopping_assistance_system/screens/chart.dart';
import 'package:shopping_assistance_system/screens/home_screen.dart';
import 'package:shopping_assistance_system/screens/note.dart';
import 'package:shopping_assistance_system/screens/settings.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final controller = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: const [Home(), Note(), Chart(), Settings()],
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.grey.shade300,
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
            items: [
              _bottombarItem(IconlyBold.home, "Home"),
              _bottombarItem(IconlyBold.document, "Note"),
              _bottombarItem(IconlyBold.chart, "chart"),
              _bottombarItem(IconlyBold.setting, "setting"),
            ]),
      );
    });
  }
}

_bottombarItem(IconData icon, String label) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
