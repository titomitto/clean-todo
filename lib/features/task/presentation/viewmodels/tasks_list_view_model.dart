import 'dart:developer';

import 'package:clean_todo/core/presentation/viewmodels/view_model.dart';
import 'package:clean_todo/core/utils/sl.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/usecases/get_tasks.dart';

class TasksListViewModel extends ViewModel {
  List<Task> tasks = [];
  GetTasks getTasks = sl();

  void fetchTasks() async {
    var response = await getTasks();
    response.fold(
      (l) => log("ERRR $l"),
      (r) {
        log("RES $r");
        tasks = r;
        notifyListeners();
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }
}
