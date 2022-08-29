import 'package:clean_todo/core/domain/usecases/usecase.dart';
import 'package:clean_todo/core/failure/failure.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;

class UpdateTask
    extends UseCase<Future<Either<Failure, bool>>, UpdateTaskParams> {
  TaskRepository repository;

  UpdateTask({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call(UpdateTaskParams params) {
    return repository.updateTask(params.task);
  }
}

class UpdateTaskParams {
  Task task;
  UpdateTaskParams({
    required this.task,
  });
}
