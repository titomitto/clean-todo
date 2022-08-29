// ignore_for_file: unused_import

import 'package:clean_todo/core/core_injector.dart';
import 'package:clean_todo/core/presentation/app_localizations.dart';
import 'package:clean_todo/core/presentation/router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'injector.dart';
import 'presentation/app.dart';
import 'presentation/screens/screen.dart';
import 'utils/sl.dart';

class Initializer {
  String title;
  List<Injector> injectors;
  String defaultRoute;
  GetIt sl = GetIt.I();
  Initializer({
    required this.title,
    required this.injectors,
    required this.defaultRoute,
  });

  injectViewModels() async {
    for (var injector in injectors) {
      await injector.registerViewModels(sl);
    }
  }

  injectUseCases() async {
    for (var injector in injectors) {
      await injector.registerUseCases(sl);
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
      await injector.registerDataSources(sl);
      await injector.registerRepositories(sl);
    }
  }

  initTranslations() async {
    List<LocaleTranslations> localeTranslations =
        injectors.expand((e) => e.translations).toList();
    sl.registerSingleton<List<LocaleTranslations>>(localeTranslations);
  }

  Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    injectors.add(CoreInjector());
    await initRepositories();
    await injectUseCases();
    await injectViewModels();
    await initTranslations();
    injectRoutes();
    runApp(App(
      title: title,
    ));
  }
}
