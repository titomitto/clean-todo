import 'package:clean_todo/core/initializer.dart';
import 'package:flutter/material.dart';

import 'config/injectors.dart';
import 'core/presentation/app.dart';

void main() async {
  await Initializer(
    defaultRoute: "/",
    injectors: featureInjectors,
  ).init();
  runApp(const App());
}
