import 'package:clean_todo/core/usecases/usecase.dart';
import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/tasks/data/repositories/tasks_repository_impl.dart';
import 'package:clean_todo/features/tasks/domain/entities/task.dart';
import 'package:clean_todo/features/tasks/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addTaskUseCaseProvider = Provider<AddTask>((ref) {
  final repository = ref.read(tasksRepositoryProvider);
  return AddTask(repository: repository);
});

class AddTask extends UseCase<Future<Either<Failure, void>>, AddTaskParams> {
  TasksRepository repository;

  AddTask({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(AddTaskParams params) {
    return repository.addTask(params.task);
  }
}

class AddTaskParams {
  Task task;
  AddTaskParams({
    required this.task,
  });
}
