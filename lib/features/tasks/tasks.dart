import 'package:clean_todo/core/shared/feature.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/models/task_model.dart';
import 'presentation/task_routes.dart';

export 'data/data.dart';
export 'domain/domain.dart';
export 'presentation/presentation.dart';

class TasksFeature extends Feature {
  @override
  List<RouteBase> get routes => taskRoutes;
  @override
  Future<void> preregister() async {
    //Hive.registerAdapter(TaskModelAdapter());
  }
}
