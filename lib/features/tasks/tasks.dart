import 'package:clean_todo/core/shared/feature.dart';
import 'package:go_router/go_router.dart';
import 'presentation/task_routes.dart';

export 'data/data.dart';

class TasksFeature extends Feature {
  @override
  List<RouteBase> get routes => taskRoutes;
  @override
  Future<void> preregister() async {}
}
