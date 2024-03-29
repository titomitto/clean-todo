import 'package:clean_todo/features/tasks/presentation/states/task_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain.dart';

class TaskController extends StateNotifier<TaskState> {
  AddTask addTask;
  DeleteTask deleteTask;
  UpdateTask updateTask;
  TaskController({
    required this.addTask,
    required this.deleteTask,
    required this.updateTask,
  }) : super(TaskInitial());

  void saveTask(String title) async {
    state = TaskSaving();
    var response = await addTask(AddTaskParams(title: title));
    await response.fold((failure) {
      state = TaskError(failure);
    }, (success) async {
      state = TaskAdded();
    });
  }

  void removeTask(Task task) async {
    var response = await deleteTask(DeleteTaskParams(task: task));

    await response.fold((failure) {
      state = TaskError(failure);
    }, (_) async {
      state = TaskDeleted();
    });
  }

  void toggle(Task task) async {
    var response = await updateTask(
      UpdateTaskParams(
        task: task.copyWith(
          isDone: !task.isDone,
        ),
      ),
    );

    response.fold((failure) {
      state = TaskError(failure);
    }, (_) {
      state = TaskUpdated();
    });
  }
}

final taskProvider =
    StateNotifierProvider.autoDispose<TaskController, TaskState>((ref) {
  AddTask addTask = ref.watch(addTaskUseCaseProvider);
  DeleteTask deleteTask = ref.watch(deleteTaskUseCaseProvider);
  UpdateTask updateTask = ref.watch(updateTaskUseCaseProvider);
  return TaskController(
    addTask: addTask,
    deleteTask: deleteTask,
    updateTask: updateTask,
  );
});
