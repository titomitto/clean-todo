import 'dart:developer';

import 'package:clean_todo/core/presentation/router.dart';
import 'package:clean_todo/core/presentation/view_models/view_model.dart';
import 'package:clean_todo/features/todo/domain/usecases/add_count.dart';
import 'package:clean_todo/features/todo/presentation/view_models/todos_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'injector.dart';
import 'presentation/app_view_model.dart';
import 'utils/service_locator.dart';

class Initializer {
  List<Injector> featureInjectors;
  Initializer({required this.featureInjectors});

  Future inject() async {
    List translations = [];
    List usecases = [];

    for (var injector in featureInjectors) {
      translations.addAll(injector.translations);
      usecases.addAll(injector.useCases);
    }
  }

  injectViewModels() {
    for (var injector in featureInjectors) {
      for (var viewModel in injector.viewModels) {
        //getIt.registerFactory(() => viewModel);
        log("TYYYOE ${viewModel.runtimeType}, ${getIt.currentScopeName}");
      }
    }
  }

  injectProviders() {
    List<ChangeNotifierProvider> providers = [];
    for (var injector in featureInjectors) {
      for (var provider in injector.providers) {
        providers.add(provider);
      }
    }
    getIt.registerSingleton<List<ChangeNotifierProvider>>(providers);
  }

  injectRoutes() {
    AppRouter routeConfig = AppRouter(routes: {});
    for (var injector in featureInjectors) {
      for (var screen in injector.screens) {
        routeConfig.routes
            .putIfAbsent(screen.routeName, () => (context) => screen);
      }
    }
    getIt.registerSingleton<AppRouter>(routeConfig);
  }

  initDB() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    for (var injector in featureInjectors) {
      for (var adapter in injector.adapters) {
        Hive.registerAdapter(adapter);
      }
    }
  }

  Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initDB();
    getIt.registerFactory<TodosViewModel>(() => TodosViewModel());
    //getIt.registerSingleton<AppViewModel>(AppViewModel());
    getIt.registerSingleton<AddCount>(AddCount());
    await injectViewModels();
    await injectProviders();
    injectRoutes();
  }
}
