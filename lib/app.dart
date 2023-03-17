import 'package:clean_todo/core/localization/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';

import 'config/theme.dart';

class App extends StatelessWidget {
  final String title;
  final GoRouter router;
  const App({
    Key? key,
    required this.title,
    required this.router,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: ToastPosition.bottom,
      child: MaterialApp.router(
        darkTheme: darkTheme,
        theme: lightTheme,
        themeMode: ThemeMode.dark,
        routerConfig: router,
        title: title,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('sw', 'KE'),
        ],
      ),
    );
  }
}
