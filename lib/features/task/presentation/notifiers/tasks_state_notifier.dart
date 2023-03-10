import 'package:clean_todo/features/task/presentation/notifiers/tasks_state.dart';
import 'package:riverpod/riverpod.dart';

import '../../domain/entities/task.dart';

class TasksStateNotifier extends StateNotifier<TasksState> {
  StateNotifierProviderRef ref;
  TasksStateNotifier(this.ref)
      : super(TasksState(tasks: [], isLoading: false, isSaving: false));

  void addTask(Task task) {
    state = state.loading();
    //ref.
    // state = [...state, task];
  }

  void removeTask(Task task) {}

  void toggle(Task task) {}
}

final tasksStateNotifierProvider =
    StateNotifierProvider<TasksStateNotifier, TasksState>((ref) {
  return TasksStateNotifier(ref);
});
