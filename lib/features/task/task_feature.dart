import 'package:clean_todo/core/feature.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'presentation/task_routes.dart';

class TaskFeature extends Feature {
  @override
  List<RouteBase> get routes => taskRoutes;
  @override
  Future<void> preregister() async {
    await Hive.initFlutter();
  }
}
