import 'package:clean_todo/core/usecases/usecase.dart';
import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/task_repository_impl.dart';

final getTasksUseCaseProvider = Provider<GetTasksUseCase>((ref) {
  final repository = ref.read(taskRepositoryProvider);
  return GetTasksUseCase(repository: repository);
});

class GetTasksUseCase
    extends NoParamsUseCase<Future<Either<Failure, List<Task>>>> {
  TaskRepository repository;

  GetTasksUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Task>>> call() {
    return repository.getTasks();
  }
}
