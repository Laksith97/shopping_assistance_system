import 'package:get/get.dart';
import 'package:shopping_assistance_system/navbar/navbar.dart';
import 'package:shopping_assistance_system/screens/chart.dart';
import 'package:shopping_assistance_system/screens/home_screen.dart';
import 'package:shopping_assistance_system/screens/note.dart';
import 'package:shopping_assistance_system/screens/settings.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const NavBar()),
    GetPage(name: home, page: () => const Home()),
    GetPage(name: note, page: () => const Note()),
    GetPage(name: chart, page: () => const Chart()),
    GetPage(name: setting, page: () => const Settings())
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
