import 'package:flutter/material.dart';

class AppRouter {
  Map<String, Widget Function(BuildContext)> routes;
  AppRouter({
    required this.routes,
  });
}
