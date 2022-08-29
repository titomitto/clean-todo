import 'dart:developer';

import 'package:clean_todo/core/presentation/app_localizations.dart';
import 'package:clean_todo/core/presentation/router.dart';
import 'package:clean_todo/core/presentation/viewmodels/view_model.dart';
import 'package:clean_todo/core/presentation/widgets/view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class App extends View<MOOsViewModel> {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    var appRouter = GetIt.I<AppRouter>();
    return MaterialApp(
      routes: appRouter.routes,
      initialRoute: appRouter.defaultRoute,
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
    );
  }
}

class MOOsViewModel extends AppViewModel {
  @override
  void onResume() {
    log("ON RESUMED $context");
    if (context != null) {
      showDialog(
          context: context!,
          builder: (context) {
            return const AlertDialog(
              title: Text("Heeey"),
              content: Text("Woohan a Yut"),
            );
          });
    }
  }

  @override
  void onInit() {
    log("YUUUUT A FOOT ");
  }
}
