import 'package:clean_todo/core/infra/initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';
import 'config/features.dart';
import 'core/utils/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  AppConfig config = await Initializer(
    features: features,
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
