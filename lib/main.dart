import 'package:clean_todo/core/initializer.dart';
import 'package:clean_todo/features/todo/todo_injector.dart';
import 'package:flutter/material.dart';

import 'config/injectors.dart';
import 'core/presentation/app.dart';

void main() async {
  await Initializer(
    featureInjectors: injectors,
  ).init();
  runApp(App());
}
