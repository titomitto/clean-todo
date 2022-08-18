import 'package:clean_todo/core/domain/usecases/usecase.dart';
import 'package:clean_todo/core/failure/failure.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;

class WatchTasks extends NoParamsUseCase<Stream<Either<Failure, List<Task>>>> {
  TaskRepository repository;

  WatchTasks({
    required this.repository,
  });

  @override
  Stream<Either<Failure, List<Task>>> call() {
    return repository.watchTasks();
  }
}
