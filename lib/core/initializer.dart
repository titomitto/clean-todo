import 'package:clean_todo/core/presentation/router.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'injector.dart';
import 'utils/service_locator.dart';

class Initializer {
  List<Injector> injectors;
  Initializer(this.injectors);

  Future inject() async {
    List translations = [];
    List usecases = [];
    List<ChangeNotifierProvider> providers = [];

    for (var injector in injectors) {
      translations.addAll(injector.translations);
      usecases.addAll(injector.usecases);
      providers.addAll(injector.providers);
    }
  }

  injectProviders() {
    List<ChangeNotifierProvider> providers = [];
    for (var injector in injectors) {
      for (var provider in injector.providers) {
        providers.add(provider);
      }
    }
    getIt.registerSingleton<List<ChangeNotifierProvider>>(providers);
  }

  injectRoutes() {
    RouteConfig routeConfig = RouteConfig(routes: {});
    for (var injector in injectors) {
      for (var screen in injector.screens) {
        routeConfig.routes.putIfAbsent(screen.routeName, () => screen);
      }
    }
    getIt.registerSingleton<RouteConfig>(routeConfig);
  }

  initDB() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    for (var injector in injectors) {
      for (var adapter in injector.adapters) {
        Hive.registerAdapter(adapter);
      }
    }
  }

  Future init() async {
    await initDB();
    await injectProviders();
    injectRoutes();
  }
}
