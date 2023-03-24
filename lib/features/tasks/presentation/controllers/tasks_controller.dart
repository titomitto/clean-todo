import 'package:clean_todo/features/tasks/presentation/state/tasks_state.dart';
import 'package:riverpod/riverpod.dart';
import '../../domain/domain.dart';

final tasksProvider =
    StateNotifierProvider.autoDispose<TasksController, TasksState>((ref) {
  GetTasks getTaskUseCase = ref.watch(getTasksUseCaseProvider);
  return TasksController(ref, getTaskUseCase);
});

class TasksController extends StateNotifier<TasksState> {
  StateNotifierProviderRef ref;
  GetTasks getTasksUseCase;
  TasksController(this.ref, this.getTasksUseCase) : super(TasksInitial()) {
    getTasks();
  }

  void addTask(String title) async {
    state = TasksLoading();

    final addTask = ref.read(addTaskUseCaseProvider);

    var task = Task(title: title);

    var response = await addTask(AddTaskParams(task: task));
    await response.fold((failure) {
      state = TasksError(failure.message);
    }, (success) async {
      await getTasks();
    });
  }

  Future<void> getTasks() async {
    state = TasksLoading();

    var response = await getTasksUseCase();

    response.fold((failure) {
      state = TasksError(failure.message);
    }, (tasks) {
      if (tasks.isEmpty) {
        state = TasksEmpty();
        return;
      }
      state = TasksData(tasks);
    });
  }

  void deleteTask(Task task) async {
    final deleteTask = ref.read(deleteTaskUseCaseProvider);

    var response = await deleteTask(DeleteTaskParams(task: task));

    await response.fold((failure) {
      state = TasksError(failure.message);
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
        ),
      ),
    );

    response.fold((failure) {
      state = TasksError(failure.message);
    }, (_) {
      getTasks();
    });
  }
}
