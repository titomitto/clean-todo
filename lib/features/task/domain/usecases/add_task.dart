import 'package:clean_todo/core/usecases/usecase.dart';
import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/task/data/repositories/tasks_repository_impl.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addTaskUseCaseProvider = FutureProvider<AddTask>((ref) async {
  final repository = await ref.read(tasksRepositoryProvider.future);
  return AddTask(repository: repository);
});

class AddTask extends UseCase<Future<Either<Failure, bool>>, AddTaskParams> {
  TasksRepository repository;

  AddTask({
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
