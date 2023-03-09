import 'package:clean_todo/core/initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'config/features.dart';
import 'core/utils/app_config.dart';

void main() async {
  AppConfig config = await Initializer(
    injectors: features,
    initialRoute: '/',
  ).init();

  var app = ProviderScope(
    child: App(
      title: "Todo Tasks",
      config: config,
    ),
  );

  runApp(app);
}
