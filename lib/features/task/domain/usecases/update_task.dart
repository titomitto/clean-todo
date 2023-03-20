import 'package:clean_todo/core/usecases/usecase.dart';
import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/tasks_repository_impl.dart';

final updateTaskUseCaseProvider = FutureProvider<UpdateTask>((ref) async {
  final repository = await ref.read(tasksRepositoryProvider.future);
  return UpdateTask(repository: repository);
});

class UpdateTask
    extends UseCase<Future<Either<Failure, void>>, UpdateTaskParams> {
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
