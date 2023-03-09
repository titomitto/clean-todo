import 'dart:developer';

import 'package:clean_todo/core/presentation/viewmodels/view_model.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';

class TaskViewModel extends ViewModel {
  void onCheck(Task task) async {
    log("CHECK_ ${task.isDone}");
    //await updateTask(UpdateTaskParams(task: task..isDone = !task.isDone));
  }

  void onDeleteTask(Task task) async {
    //await deleteTask(DeleteTaskParams(task: task));
  }
}
