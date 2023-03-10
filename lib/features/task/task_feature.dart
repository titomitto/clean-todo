import 'package:clean_todo/core/feature.dart';
import 'package:clean_todo/features/task/presentation/screens/add_task_screen.dart';
import 'package:go_router/go_router.dart';

import 'presentation/screens/tasks_screen.dart';

class TaskFeature extends Feature {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          path: TasksScreen.routePath,
          builder: (context, state) => const TasksScreen(),
        ),
        GoRoute(
          path: AddTaskScreen.routePath,
          builder: (context, state) => const AddTaskScreen(),
        ),
      ];
  @override
  Future<void> preregister() async {}
}
