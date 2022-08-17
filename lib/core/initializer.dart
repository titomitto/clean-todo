// ignore_for_file: unused_import

import 'package:clean_todo/core/presentation/app_localizations.dart';
import 'package:clean_todo/core/presentation/router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'injector.dart';
import 'presentation/screens/screen.dart';
import 'utils/sl.dart';

class Initializer {
  List<Injector> injectors;
  String defaultRoute;
  Initializer({
    required this.injectors,
    required this.defaultRoute,
  });

  injectViewModels() async {
    for (var injector in injectors) {
      await injector.registerViewModels();
    }
  }

  injectUseCases() async {
    for (var injector in injectors) {
      await injector.registerUseCases();
    }
  }

  injectRoutes() {
    List<Screen> screens = injectors.expand((e) => e.screens).toList();
    AppRouter appRouter =
        AppRouter(screens: screens, defaultRoute: defaultRoute);
    sl.registerSingleton<AppRouter>(appRouter);
  }

  initRepositories() async {
    await Hive.initFlutter();
    for (var injector in injectors) {
      await injector.registerAdapters();
      await injector.registerDataSources();
      await injector.registerRepositories();
    }
  }

  initTranslations() async {
    List<LocaleTranslations> localeTranslations =
        injectors.expand((e) => e.translations).toList();
    sl.registerSingleton<List<LocaleTranslations>>(localeTranslations);
  }

  Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initRepositories();
    await injectUseCases();
    await injectViewModels();
    await initTranslations();
    injectRoutes();
  }
}
