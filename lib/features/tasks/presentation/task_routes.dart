import 'package:go_router/go_router.dart';

import 'screens/add_task_screen.dart';
import 'screens/tasks_screen.dart';

final List<GoRoute> taskRoutes = [
  GoRoute(
    path: TasksScreen.routePath,
    builder: (context, state) => const TasksScreen(),
  ),
  GoRoute(
    path: AddTaskScreen.routePath,
    builder: (context, state) => const AddTaskScreen(),
  ),
];
