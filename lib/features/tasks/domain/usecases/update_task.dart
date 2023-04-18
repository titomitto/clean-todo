import 'package:clean_todo/core/usecases/usecase.dart';
import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/tasks/domain/entities/task.dart';
import 'package:clean_todo/features/tasks/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/tasks_repository_impl.dart';

final updateTaskUseCaseProvider = Provider<UpdateTask>((ref) {
  final repository = ref.read(tasksRepositoryProvider);
  return UpdateTask(repository: repository);
});

class UpdateTask extends UseCase<void, UpdateTaskParams> {
  TasksRepository repository;

  UpdateTask({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(UpdateTaskParams params) {
    return repository.updateTask(params.task);
  }
}

class UpdateTaskParams {
  Task task;
  UpdateTaskParams({
    required this.task,
  });
}
