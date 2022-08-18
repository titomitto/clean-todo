import 'package:clean_todo/core/domain/usecases/usecase.dart';
import 'package:clean_todo/core/failure/failure.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;

class DeleteTask
    extends UseCase<Future<Either<Failure, bool>>, DeleteTaskParams> {
  TaskRepository repository;

  DeleteTask({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call(DeleteTaskParams params) {
    return repository.deleteTask(params.task);
  }
}

class DeleteTaskParams {
  Task task;
  DeleteTaskParams({
    required this.task,
  });
}
