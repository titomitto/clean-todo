import 'package:clean_todo/core/presentation/router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appRouter = GetIt.I<AppRouter>();

    return MaterialApp(
      routes: appRouter.routes,
      initialRoute: appRouter.defaultRoute,
    );
  }
}
