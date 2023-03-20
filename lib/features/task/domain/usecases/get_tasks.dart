import 'package:clean_todo/core/usecases/usecase.dart';
import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/tasks_repository_impl.dart';

final getTasksUseCaseProvider = FutureProvider<GetTasks>((ref) async {
  final repository = await ref.read(tasksRepositoryProvider.future);
  return GetTasks(repository: repository);
});

class GetTasks extends NoParamsUseCase<Future<Either<Failure, List<Task>>>> {
  TasksRepository repository;

  GetTasks({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Task>>> call() {
    return repository.getTasks();
  }
}
