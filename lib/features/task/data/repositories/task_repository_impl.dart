import 'package:clean_todo/core/failure/exceptions.dart';
import 'package:clean_todo/core/failure/failure.dart';
import 'package:clean_todo/features/task/data/datasources/tasks_local_datasource.dart';
import 'package:clean_todo/features/task/data/mappers/task.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;

class TaskRepositoryImpl extends TaskRepository {
  TasksLocalDataSource localDataSource;

  TaskRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<bool> updateTask(Task task) {
    return localDataSource.updateTask(task.toModel());
  }

  @override
  Future<Either<Failure, bool>> addTask(Task task) async {
    try {
      var done = await localDataSource.addTask(task.toModel());
      return Right(done);
    } catch (e) {
      return Left(CachePutFailure());
    }
  }
}
