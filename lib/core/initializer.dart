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
  List<Feature> features;
  String initialRoute;
  Initializer({
    required this.features,
    required this.initialRoute,
  });

  preregister() async {
    for (var feature in features) {
      await feature.preregister();
    }
  }

  GoRouter registerRoutes() {
    final GoRouter router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: initialRoute,
      routes: <RouteBase>[
        ...features.expand((e) => e.routes),
      ],
    );
    return router;
  }

  Future<AppConfig> init() async {
    await preregister();
    var router = registerRoutes();
    return AppConfig(router: router);
  }
}
