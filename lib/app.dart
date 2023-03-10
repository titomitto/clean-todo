import 'package:clean_todo/core/presentation/app_localizations.dart';
import 'package:clean_todo/core/utils/app_config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class App extends StatelessWidget {
  final String title;
  final AppConfig config;
  const App({
    Key? key,
    required this.title,
    required this.config,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: ToastPosition.bottom,
      child: MaterialApp.router(
        routerConfig: config.router,
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
