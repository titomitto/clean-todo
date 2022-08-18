import 'dart:developer';

import 'package:clean_todo/core/presentation/viewmodels/view_model.dart';
import 'package:clean_todo/core/utils/sl.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/usecases/delete_task.dart';
import 'package:clean_todo/features/task/domain/usecases/update_task.dart';

class TaskViewModel extends ViewModel {
  DeleteTask deleteTask = sl();
  UpdateTask updateTask = sl();

  void onCheck(Task task) async {
    log("CHECK_ ${task.isDone}");
    await updateTask(UpdateTaskParams(task: task..isDone = !task.isDone));
  }

  void onDeleteTask(Task task) async {
    await deleteTask(DeleteTaskParams(task: task));
  }
}
