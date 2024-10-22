import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "controller/provider.dart";
import "generated/l10n.dart";


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(s.appTitle),
        actions: <Widget>[
          _buildLanguageMenu(context, localeProvider),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              s.appTitle,
             //myown style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              s.welcomeMessage,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Text('setting'),
            _buildLanguageMenu(context, localeProvider)
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageMenu(BuildContext context, LocaleProvider localeProvider) {
    return PopupMenuButton<Locale>(
        onSelected: (Locale locale) {
          localeProvider.setLocale(locale);
        },
        icon: Text('language'),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale>>[
    PopupMenuItem<Locale>(
        value: Locale('en', ),
        child: Text('English'),
    ),
    PopupMenuItem<Locale>(
    value: Locale('hi', ),
    child: Text('हिंदी'),
    ),
    ],
    );
    }
}


