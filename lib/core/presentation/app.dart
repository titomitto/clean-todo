import 'package:clean_todo/core/presentation/router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var routes = GetIt.I<AppRouter>().routes;

    return MaterialApp(
      routes: routes,
      initialRoute: "/todos",
    );
  }
}
