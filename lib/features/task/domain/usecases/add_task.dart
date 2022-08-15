import 'dart:developer';

import 'package:clean_todo/core/domain/usecases/usecase.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';

class AddTask extends UseCase<bool, AddTaskParams> {
  @override
  bool call(AddTaskParams params) {
    log("ADD_TASK ${params.task.title}");
    return true;
  }
}

class AddTaskParams {
  Task task;
  AddTaskParams({
    required this.task,
  });
}
