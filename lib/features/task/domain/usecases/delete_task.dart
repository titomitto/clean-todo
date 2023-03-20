import 'package:clean_todo/core/usecases/usecase.dart';
import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/task_repository_impl.dart';

final deleteTaskUseCaseProvider = Provider<DeleteTask>((ref) {
  final repository = ref.read(taskRepositoryProvider);
  return DeleteTask(repository: repository);
});

class DeleteTask
    extends UseCase<Future<Either<Failure, bool>>, DeleteTaskParams> {
  TaskRepository repository;

  DeleteTask({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call(DeleteTaskParams params) {
    return repository.deleteTask(params.task);
  }
}

class DeleteTaskParams {
  Task task;
  DeleteTaskParams({
    required this.task,
  });
}
