import 'package:clean_todo/core/usecases/usecase.dart';
import 'package:clean_todo/core/errors/failures.dart';
import 'package:clean_todo/features/tasks/domain/entities/task.dart';
import 'package:clean_todo/features/tasks/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/tasks_repository_impl.dart';

class GetTasks extends NoParamsUseCase<List<Task>> {
  TasksRepository repository;

  GetTasks({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Task>>> call() {
    return repository.getTasks();
  }
}

final getTasksUseCaseProvider = Provider.autoDispose<GetTasks>((ref) {
  final repository = ref.watch(tasksRepositoryProvider);
  return GetTasks(repository: repository);
});
