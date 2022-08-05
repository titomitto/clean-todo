import 'dart:developer';

import 'package:clean_todo/core/presentation/router.dart';
import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/core/presentation/view_models/app_view_model.dart';
import 'package:clean_todo/core/presentation/view_models/view_model.dart';
import 'package:clean_todo/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view.dart';

class App extends View<AppViewModel> {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getIt<List<ChangeNotifierProvider>>(),
      child: MaterialApp(
        routes: getIt<RouteConfig>().routes,
        initialRoute: "/todos",
      ),
    );
  }
}
