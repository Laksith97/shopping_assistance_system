import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shopping_assistance_system/classes/localeProvider.dart';
import 'package:provider/provider.dart';

class languageSupport extends StatefulWidget {
  const languageSupport({Key? key}) : super(key: key);

  @override
  _LanguageSupportState createState() => _LanguageSupportState();
}

class _LanguageSupportState extends State<languageSupport> {
  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Language'),
        backgroundColor: Color.fromARGB(255, 117, 95, 241),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!
                  .language,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                localeProvider.changeLanguage(Locale('si'));
              },
              child: Text('Change to sinhala'),
            ),
            ElevatedButton(
              onPressed: () {
                localeProvider.changeLanguage(Locale('en'));
              },
              child: Text('Change to English'),
            ),
          ],
        ),
      ),
    );
  }
}