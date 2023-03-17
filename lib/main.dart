import 'package:clean_todo/initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'config/features.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the app with features and initial route.
  final initializer = Initializer(
    features: features,
    initialRoute: '/',
  );

  // Obtain the app configuration.
  final config = await initializer.initializeApp();

  runApp(
    ProviderScope(
      child: App(
        title: 'Todo Tasks',
        config: config,
      ),
    ),
  );
}
