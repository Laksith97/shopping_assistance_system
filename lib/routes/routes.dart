import 'package:get/get.dart';
import 'package:shopping_assistance_system/navbar/navbar.dart';
import 'package:shopping_assistance_system/screens/promotions.dart';
import 'package:shopping_assistance_system/screens/shop.dart';
import 'package:shopping_assistance_system/screens/notification.dart';
import 'package:shopping_assistance_system/screens/account.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const NavBar()),
    GetPage(name: home, page: () => const Shop()),
    GetPage(name: note, page: () => const Notifications()),
    GetPage(name: chart, page: () => const Promotions()),
    GetPage(name: setting, page: () => const Account())
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
