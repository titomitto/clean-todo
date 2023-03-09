// ignore_for_file: unused_import
import 'package:clean_todo/core/presentation/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../app.dart';
import 'feature.dart';
import 'utils/app_config.dart';

GlobalKey<NavigatorState>? parentNavigatorKey = GlobalKey<NavigatorState>();

class Initializer {
  List<Feature> injectors;
  String initialRoute;
  GetIt sl = GetIt.instance;
  Initializer({
    required this.injectors,
    required this.initialRoute,
  });

  preregister() async {
    for (var injector in injectors) {
      await injector.preregister();
    }
  }

  Future<AppConfig> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await preregister();

    final GoRouter router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: initialRoute,
      routes: <RouteBase>[
        ...injectors.expand((e) => e.routes),
      ],
    );
    return AppConfig(router: router);
  }
}
