import 'package:clean_todo/core/presentation/router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'injector.dart';
import 'presentation/screens/screen.dart';

class Initializer {
  List<Injector> injectors;
  String defaultRoute;
  Initializer({
    required this.injectors,
    required this.defaultRoute,
  });

  injectViewModels() {
    for (var injector in injectors) {
      injector.registerViewModels();
    }
  }

  injectUseCases() {
    for (var injector in injectors) {
      injector.registerUseCases();
    }
  }

  injectRoutes() {
    List<Screen> screens = injectors.expand((e) => e.screens).toList();
    AppRouter appRouter =
        AppRouter(screens: screens, defaultRoute: defaultRoute);
    GetIt.I.registerSingleton<AppRouter>(appRouter);
  }

  initRepositories() async {
    await Hive.initFlutter();
    for (var injector in injectors) {
      injector.registerAdapters();
      injector.registerDataSources();
      injector.registerRepositories();
    }
  }

  Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initRepositories();
    await injectUseCases();
    await injectViewModels();
    injectRoutes();
  }
}
