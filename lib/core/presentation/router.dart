import 'package:flutter/material.dart';

class RouteConfig {
  Map<String, Widget Function(BuildContext)> routes;
  RouteConfig({
    required this.routes,
  });
}
