import 'package:riverpod/riverpod.dart';
import '../../domain/domain.dart';

final tasksProvider =
    StateNotifierProvider.autoDispose<TasksController, AsyncValue<List<Task>>>(
        (ref) {
  GetTasks getTaskUseCase = ref.watch(getTasksUseCaseProvider);
  return TasksController(ref, getTaskUseCase);
});

class TasksController extends StateNotifier<AsyncValue<List<Task>>> {
  StateNotifierProviderRef ref;
  GetTasks getTasksUseCase;
  TasksController(this.ref, this.getTasksUseCase)
      : super(const AsyncValue.loading()) {
    getTasks();
  }

  void addTask(String title) async {
    state = const AsyncLoading();

    final addTask = ref.read(addTaskUseCaseProvider);

    var task = Task(title: title);

    var response = await addTask(AddTaskParams(task: task));
    await response.fold((failure) {
      state = AsyncError(failure.message, StackTrace.current);
    }, (success) async {
      await getTasks();
    });
  }

  Future<void> getTasks() async {
    state = const AsyncLoading();

    var response = await getTasksUseCase();

    response.fold((failure) {
      state = AsyncError(failure.message, StackTrace.current);
    }, (tasks) {
      state = AsyncData(tasks);
    });
  }

  void deleteTask(Task task) async {
    final deleteTask = ref.read(deleteTaskUseCaseProvider);

    var response = await deleteTask(DeleteTaskParams(task: task));

    await response.fold((failure) {
      state = AsyncError(failure.message, StackTrace.current);
    }, (_) async {
      await getTasks();
    });
  }

  void toggle(Task task) async {
    var updateTask = ref.read(updateTaskUseCaseProvider);

    var response = await updateTask(
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
