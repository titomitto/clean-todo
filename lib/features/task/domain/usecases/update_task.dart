import 'dart:developer';

import 'package:clean_todo/core/domain/usecases/usecase.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';

class UpdateTask extends UseCase<bool, UpdateTaskParams> {
  @override
  bool call(UpdateTaskParams params) {
    log("ADD_TASK ${params.task.title}");
    return true;
  }
}

class UpdateTaskParams {
  Task task;
  UpdateTaskParams({
    required this.task,
  });
}
