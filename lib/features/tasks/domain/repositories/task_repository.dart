import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/tasks/domain/entities/task.dart';
import 'package:dartz/dartz.dart' hide Task;

abstract class TasksRepository {
  Future<Either<Failure, List<Task>>> getTasks();
  Future<Either<Failure, Unit>> createTask(String title);
  Future<Either<Failure, Unit>> updateTask(Task task);
  Future<Either<Failure, Unit>> deleteTask(Task task);
}
