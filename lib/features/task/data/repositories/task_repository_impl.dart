import 'dart:developer';

import 'package:clean_todo/core/failure/failure.dart';
import 'package:clean_todo/features/task/data/datasources/tasks_local_datasource.dart';
import 'package:clean_todo/features/task/data/mappers/task.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return TaskRepositoryImpl(ref: ref);
});

class TaskRepositoryImpl extends TaskRepository {
  Ref ref;

  TaskRepositoryImpl({
    required this.ref,
  });

  @override
  Future<Either<Failure, bool>> updateTask(Task task) async {
    try {
      var localDataSource = await ref.read(tasksLocalDataSourceProvider.future);
      var done = await localDataSource.updateTask(task.toModel());
      return Right(done);
    } catch (e) {
      return Left(CachePutFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addTask(Task task) async {
    try {
      var localDataSource = await ref.read(tasksLocalDataSourceProvider.future);
      var done = await localDataSource.addTask(task.toModel());
      return Right(done);
    } catch (e) {
      return Left(CachePutFailure());
    }
  }

  @override
  Future<Either<Failure, List<Task>>> getTasks() async {
    try {
      var localDataSource = await ref.read(tasksLocalDataSourceProvider.future);
      var taskModels = await localDataSource.getTasks();
      var tasks = taskModels.map((e) => e.toEntity()).toList();
      return Right(tasks);
    } catch (e) {
      log("$e");
      return Left(CacheGetFailure());
    }
  }

  @override
  Stream<Either<Failure, List<Task>>> watchTasks() async* {
    try {
      var localDataSource = await ref.read(tasksLocalDataSourceProvider.future);
      yield* localDataSource.watchTasks().map((event) {
        return Right(event.map((e) => e.toEntity()).toList());
      });
    } catch (e) {
      log("EEERRED $e");
      yield Left(CacheGetFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTask(Task task) async {
    try {
      var localDataSource = await ref.read(tasksLocalDataSourceProvider.future);
      var done = await localDataSource.deleteTask(task.toModel());
      return Right(done);
    } catch (e) {
      return Left(CachePutFailure());
    }
  }
}
