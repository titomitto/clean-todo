import 'dart:developer';

import 'package:clean_todo/core/domain/usecases/usecase.dart';
import 'package:clean_todo/core/failure/failure.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;

class AddTask extends UseCase<Future<Either<Failure, bool>>, AddTaskParams> {
  TaskRepository repository;

  AddTask({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call(AddTaskParams params) {
    return repository.addTask(params.task);
  }
}

class AddTaskParams {
  Task task;
  AddTaskParams({
    required this.task,
  });
}
