import 'dart:developer';

import 'package:clean_todo/core/presentation/router.dart';
import 'package:clean_todo/core/utils/service_locator.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: getIt<AppRouter>().routes,
      initialRoute: "/todos",
    );
  }
}
