import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider with ChangeNotifier {
  late Locale _appLocale;
  Locale get appLocale => _appLocale;

  LocaleProvider() {
    _appLocale = Locale('en');
    _loadLocale();
  }

  void _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language_code') ??
        'en';
    _appLocale = Locale(languageCode);
    notifyListeners();
  }

  void changeLanguage(Locale newLocale) async {
    final prefs = await SharedPreferences.getInstance();
    if (newLocale == _appLocale) return;

    if (newLocale.languageCode == 'en') {
      _appLocale = Locale('en');
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', '');
    } else if (newLocale.languageCode == 'si') {
      _appLocale = Locale('si');
      await prefs.setString('language_code', 'si');
      await prefs.setString('countryCode', '');
    }

    notifyListeners();
  }
}
