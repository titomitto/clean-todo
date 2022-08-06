import 'package:flutter/material.dart';

import 'screens/screen.dart';

class AppRouter {
  List<Screen> screens = [];
  Map<String, Widget Function(BuildContext)> routes = {};
  AppRouter({
    required this.screens,
  }) {
    for (var screen in screens) {
      routes.putIfAbsent(screen.routeName, () => (context) => screen);
    }
  }
}
