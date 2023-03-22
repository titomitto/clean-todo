import 'package:clean_todo/core/usecases/usecase.dart';
import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/tasks/domain/entities/task.dart';
import 'package:clean_todo/features/tasks/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/tasks_repository_impl.dart';

final deleteTaskUseCaseProvider = Provider<DeleteTask>((ref) {
  final repository = ref.read(tasksRepositoryProvider);
  return DeleteTask(repository: repository);
});

class DeleteTask
    extends UseCase<Future<Either<Failure, void>>, DeleteTaskParams> {
  TasksRepository repository;

  DeleteTask({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(DeleteTaskParams params) {
    return repository.deleteTask(params.task);
  }
}

class DeleteTaskParams {
  Task task;
  DeleteTaskParams({
    required this.task,
  });
}
