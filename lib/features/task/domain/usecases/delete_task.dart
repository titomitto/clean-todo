import 'package:clean_todo/core/usecases/usecase.dart';
import 'package:clean_todo/core/failure/failure.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/task_repository_impl.dart';

final deleteTaskUseCaseProvider = Provider<DeleteTaskUseCase>((ref) {
  final repository = ref.read(taskRepositoryProvider);
  return DeleteTaskUseCase(repository: repository);
});

class DeleteTaskUseCase
    extends UseCase<Future<Either<Failure, bool>>, DeleteTaskParams> {
  TaskRepository repository;

  DeleteTaskUseCase({
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
