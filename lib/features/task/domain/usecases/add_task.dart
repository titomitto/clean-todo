import 'package:clean_todo/core/usecases/usecase.dart';
import 'package:clean_todo/core/failure/failure.dart';
import 'package:clean_todo/features/task/data/repositories/task_repository_impl.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addTaskUseCaseProvider = Provider<AddTaskUseCase>((ref) {
  final repository = ref.read(taskRepositoryProvider);
  return AddTaskUseCase(repository: repository);
});

class AddTaskUseCase
    extends UseCase<Future<Either<Failure, bool>>, AddTaskParams> {
  TaskRepository repository;

  AddTaskUseCase({
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
