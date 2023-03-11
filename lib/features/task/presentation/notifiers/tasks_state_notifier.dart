import 'package:clean_todo/features/task/presentation/notifiers/tasks_state.dart';
import 'package:riverpod/riverpod.dart';

import '../../domain/entities/task.dart';
import '../../domain/usecases/add_task.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/get_tasks.dart';
import '../../domain/usecases/update_task.dart';

final tasksStateNotifierProvider =
    StateNotifierProvider<TasksStateNotifier, TasksState>((ref) {
  return TasksStateNotifier(ref);
});

class TasksStateNotifier extends StateNotifier<TasksState> {
  StateNotifierProviderRef ref;
  TasksStateNotifier(this.ref)
      : super(TasksState(tasks: [], isLoading: false, isSaving: false));

  void addTask(String title) async {
    state = state.saving();

    var addTaskUseCase = ref.read(addTaskUseCaseProvider);
    var task = Task(title: title);
    var response = await addTaskUseCase(AddTaskParams(task: task));

    await response.fold((failure) {
      state = state.withFailure(failure);
    }, (success) async {
      await getTasks();
    });
  }

  Future<void> getTasks() async {
    state = state.loading();

    var getTasksUseCase = ref.read(getTasksUseCaseProvider);

    var response = await getTasksUseCase();

    response.fold((failure) {
      state = state.withFailure(failure);
    }, (tasks) {
      state = state.data(tasks);
    });
  }

  void deleteTask(Task task) async {
    var deleteTaskUseCase = ref.read(deleteTaskUseCaseProvider);

    var response = await deleteTaskUseCase(DeleteTaskParams(task: task));

    await response.fold((failure) {
      state = state.withFailure(failure);
    }, (_) async {
      await getTasks();
    });
  }

  void toggle(Task task) async {
    var updateTaskUseCase = ref.read(updateTaskUseCaseProvider);

    var response = await updateTaskUseCase(task.copyWith(isDone: !task.isDone));

    response.fold((failure) {
      state = state.withFailure(failure);
    }, (_) {
      getTasks();
    });
  }
}
