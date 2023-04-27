import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/features.dart';
import '../features/tasks/presentation/screens/tasks_screen.dart';

final parentNavigatorKey = GlobalKey<NavigatorState>();
final initialRoute = TasksScreen.routePath;

final router = GoRouter(
  navigatorKey: parentNavigatorKey,
  initialLocation: initialRoute,
  routes: features.expand((e) => e.routes).toList(),
  debugLogDiagnostics: true,
);

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  return router;
});
