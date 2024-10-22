
import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:provider/provider.dart";

import "controller/provider.dart";
import "generated/l10n.dart";
import "home.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, child) {
          return MaterialApp(
            title: 'Multilingual App',
            locale: localeProvider.locale,
            supportedLocales: [
          Locale('en', ), // English
          Locale('hi', ), // Hindi
           //myown Locale('ml', ), // Malayalam
            ],
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              // Add your custom delegate here
            ],
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}