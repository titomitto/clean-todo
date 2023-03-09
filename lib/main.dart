import 'package:clean_todo/core/initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'config/features.dart';

void main() async {
  await Initializer(
    injectors: features,
    initialRoute: '/',
  ).init();

  runApp(const ProviderScope(
    child: App(
      title: "Todo Tasks",
    ),
  ));
}
