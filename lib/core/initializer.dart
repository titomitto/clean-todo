import 'package:clean_todo/core/presentation/router.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'injector.dart';
import 'presentation/screens/screen.dart';
import 'utils/service_locator.dart';

class Initializer {
  List<Injector> injectors;
  Initializer({required this.injectors});

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
    AppRouter appRouter = AppRouter(screens: screens);
    getIt.registerSingleton<AppRouter>(appRouter);
  }

  initData() async {
    await Hive.initFlutter();
    for (var injector in injectors) {
      injector.registerAdapters();
      injector.registerDataSources();
      injector.registerRepositories();
    }
  }

  Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initData();
    await injectUseCases();
    await injectViewModels();
    injectRoutes();
  }
}
