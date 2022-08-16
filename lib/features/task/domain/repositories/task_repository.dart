import 'package:clean_todo/core/failure/failure.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:dartz/dartz.dart' hide Task;

abstract class TaskRepository {
  Future<Either<Failure, bool>> addTask(Task task);
  Future<bool> updateTask(Task task);
}
