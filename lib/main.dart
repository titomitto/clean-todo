import 'package:clean_todo/initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'config/features.dart';

Future<void> main() async {
  // Pass required features to the initializer
  final initializer = Initializer(
    features: features,
    initialRoute: '/',
  );
  // initialize the app
  await initializer.initializeApp();
}
