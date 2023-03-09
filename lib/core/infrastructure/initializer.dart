import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../presentation/app.dart';
import 'injector.dart';

GlobalKey<NavigatorState>? parentNavigatorKey = GlobalKey<NavigatorState>();

class Initializer {
  String title;
  List<Injector> injectors;
  String initialRoute;
  GetIt sl = GetIt.instance;
  Initializer({
    required this.title,
    required this.injectors,
    required this.initialRoute,
  });

  Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await preregister();

    final GoRouter routers = GoRouter(
        navigatorKey: parentNavigatorKey,
        initialLocation: initialRoute,
        routes: <RouteBase>[
          ...injectors.expand((e) => e.routes),
        ]);

    runApp(App(
      title: title,
      routes: routers,
    ));
  }

  preregister() async {
    for (var injector in injectors) {
      await injector.preregister();
    }
  }
}
