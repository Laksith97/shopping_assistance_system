import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:shopping_assistance_system/controller/controller.dart';
import 'package:shopping_assistance_system/screens/promotions.dart';
import 'package:shopping_assistance_system/screens/shop.dart';
import 'package:shopping_assistance_system/screens/explore.dart';
import 'package:shopping_assistance_system/screens/account.dart';

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
          children: const [Shop(), Explore(), Promotions(), Account()],
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.grey.shade300,
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
            items: [
              _bottombarItem(IconlyBold.bag, "Shop"),
              _bottombarItem(IconlyBold.search, "Explore"),
              _bottombarItem(IconlyBold.discount, "Promotions"),
              _bottombarItem(IconlyBold.profile, "Account"),
            ]),
      );
    });
  }
}

_bottombarItem(IconData icon, String label) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
