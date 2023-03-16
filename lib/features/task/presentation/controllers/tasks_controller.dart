import 'package:riverpod/riverpod.dart';

import '../../domain/entities/task.dart';
import '../../domain/usecases/add_task.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/get_tasks.dart';
import '../../domain/usecases/update_task.dart';

final tasksControllerProvider =
    StateNotifierProvider.autoDispose<TasksController, AsyncValue<List<Task>>>(
        (ref) {
  return TasksController(ref);
});

class TasksController extends StateNotifier<AsyncValue<List<Task>>> {
  StateNotifierProviderRef ref;
  TasksController(this.ref) : super(const AsyncValue.loading()) {
    getTasks();
  }

  void addTask(String title) async {
    state = const AsyncLoading();

    var addTaskUseCase = ref.read(addTaskUseCaseProvider);

    var task = Task(title: title);

    var response = await addTaskUseCase(AddTaskParams(task: task));
    await response.fold((failure) {
      state = AsyncError(failure.message, StackTrace.current);
    }, (success) async {
      await getTasks();
    });
  }

  Future<void> getTasks() async {
    state = const AsyncLoading();

    var getTasksUseCase = ref.read(getTasksUseCaseProvider);

    var response = await getTasksUseCase();

    response.fold((failure) {
      state = AsyncError(failure.message, StackTrace.current);
    }, (tasks) {
      state = AsyncData(tasks);
    });
  }

  void deleteTask(Task task) async {
    var deleteTaskUseCase = ref.read(deleteTaskUseCaseProvider);

    var response = await deleteTaskUseCase(DeleteTaskParams(task: task));

    await response.fold((failure) {
      state = AsyncError(failure.message, StackTrace.current);
    }, (_) async {
      await getTasks();
    });
  }

  void toggle(Task task) async {
    var updateTaskUseCase = ref.read(updateTaskUseCaseProvider);

    var response = await updateTaskUseCase(
      UpdateTaskParams(
          task: task.copyWith(
        isDone: !task.isDone,
      )),
    );

    response.fold((failure) {
      state = AsyncError(failure.message, StackTrace.current);
    }, (_) {
      getTasks();
    });
  }
}
