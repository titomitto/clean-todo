// ignore_for_file: unused_import
import 'package:clean_todo/core/presentation/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'core/feature.dart';
import 'core/app_config.dart';
import 'core/utils/navigator_key.dart';

class Initializer {
  final List<Feature> features;
  final String initialRoute;

  Initializer({
    required this.features,
    required this.initialRoute,
  });

  Future<void> preregisterFeatures() async {
    for (var feature in features) {
      await feature.preregister();
    }
  }

  GoRouter registerRoutes() {
    final router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: initialRoute,
      routes: features.expand((e) => e.routes).toList(),
    );
    return router;
  }

  Future<AppConfig> initializeApp() async {
    final initializer = Initializer(
      features: features,
      initialRoute: '/',
    );
    await Hive.initFlutter();
    await initializer.preregisterFeatures();
    final router = initializer.registerRoutes();
    return AppConfig(router: router);
  }
}
