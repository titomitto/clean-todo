import 'dart:developer';

import 'package:clean_todo/core/presentation/app_localizations.dart';
import 'package:clean_todo/core/presentation/router.dart';
import 'package:clean_todo/core/presentation/viewmodels/view_model.dart';
import 'package:clean_todo/core/presentation/widgets/view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class App extends View<AppViewModel> {
  final String title;
  App({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    var appRouter = GetIt.I<AppRouter>();
    return MaterialApp(
      title: title,
      routes: appRouter.routes,
      initialRoute: appRouter.defaultRoute,
      builder: (context, widget) {
        viewModel.context = context;
        return widget ?? const SizedBox();
      },
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

class AppViewModel extends ViewModel {
  @override
  void onInit() {}
}
