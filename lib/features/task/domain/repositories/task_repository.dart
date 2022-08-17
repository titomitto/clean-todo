import 'package:clean_todo/core/failure/failure.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:dartz/dartz.dart' hide Task;

abstract class TaskRepository {
  Stream<Either<Failure, List<Task>>> watchTasks();
  Future<Either<Failure, List<Task>>> getTasks();
  Future<Either<Failure, bool>> addTask(Task task);
  Future<bool> updateTask(Task task);
}
