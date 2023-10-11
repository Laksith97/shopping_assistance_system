import 'package:get/get.dart';
import 'package:shopping_assistance_system/navbar/navbar.dart';
import 'package:shopping_assistance_system/screens/promotionsScreen.dart';
import 'package:shopping_assistance_system/screens/shopScreen.dart';
import 'package:shopping_assistance_system/screens/notificationsScreen.dart';
import 'package:shopping_assistance_system/screens/accountScreen.dart';

import '../screens/loginScreen.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(
        name: navbar,
        page: () => const NavBar(
              userEmail: '',
            )),
    GetPage(
        name: shop,
        page: () => const ShopScreen(
              userEmail: '',
            )),
    GetPage(name: notifications, page: () => const NotificationsScreen()),
    GetPage(name: promotions, page: () =>  CheckPromotionScreen()),
    GetPage(
        name: account,
        page: () => const AccountScreen(
              userEmail: '',
            )),
    GetPage(name: login, page: () => const LoginScreen())
  ];

  static String navbar = '/';
  static String shop = '/home';
  static String notifications = '/note';
  static String promotions = '/chart';
  static String account = '/settings';
  static String login = '/login';
}
