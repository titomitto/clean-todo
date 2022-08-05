import 'package:clean_todo/core/initializer.dart';
import 'package:flutter/material.dart';

import 'config/injectors.dart';
import 'core/presentation/app.dart';

void main() async {
  await Initializer(
    featureInjectors: injectors,
  ).init();
  runApp(const App());
}
