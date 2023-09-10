import 'package:get/get.dart';
import 'package:shopping_assistance_system/navbar/navbar.dart';
import 'package:shopping_assistance_system/screens/promotionsScreen.dart';
import 'package:shopping_assistance_system/screens/shopScreen.dart';
import 'package:shopping_assistance_system/screens/notificationsScreen.dart';
import 'package:shopping_assistance_system/screens/accountScreen.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const NavBar()),
    GetPage(name: home, page: () => const ShopScreen()),
    GetPage(name: note, page: () => const NotificationsScreen()),
    GetPage(name: chart, page: () => const PromotionsScreen()),
    GetPage(name: setting, page: () => const AccountScreen())
  ];

  static getnavbar() => navbar;
  static gethome() => home;
  static getnote() => note;
  static getchart() => chart;
  static getsettings() => setting;
  //
  static String navbar = '/';
  static String home = '/home';
  static String note = '/note';
  static String chart = '/chart';
  static String setting = '/settings';
}
