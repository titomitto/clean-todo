import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:dartz/dartz.dart' hide Task;

abstract class TasksRepository {
  Future<Either<Failure, List<Task>>> getTasks();
  Future<Either<Failure, bool>> addTask(Task task);
  Future<Either<Failure, bool>> updateTask(Task task);
  Future<Either<Failure, bool>> deleteTask(Task task);
}
