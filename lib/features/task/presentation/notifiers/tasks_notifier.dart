import 'package:riverpod/riverpod.dart';

import '../../domain/entities/task.dart';

class TasksNotifier extends StateNotifier<List<Task>> {
  TasksNotifier() : super([]);

  void addTask(Task task) {
    state = [...state, task];
  }

  void removeTask(int taskId) {
    state = [
      for (final task in state)
        if (task.id != taskId) task,
    ];
  }

  void toggle(int taskId) {
    state = [
      for (final task in state)
        if (task.id == taskId) task..isDone = !task.isDone else task,
    ];
  }
}

final tasksProvider = StateNotifierProvider<TasksNotifier, List<Task>>((ref) {
  return TasksNotifier();
});
