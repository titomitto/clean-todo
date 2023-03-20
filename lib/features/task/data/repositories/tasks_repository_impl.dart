import 'dart:developer';

import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/task/data/datasources/tasks_local_datasource.dart';
import 'package:clean_todo/features/task/data/mappers/task.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tasksRepositoryProvider = FutureProvider<TasksRepository>((ref) async {
  final tasksLocalDataSource =
      await ref.read(tasksLocalDataSourceProvider.future);
  return TasksRepositoryImpl(localDataSource: tasksLocalDataSource);
});

class TasksRepositoryImpl extends TasksRepository {
  TasksLocalDataSource localDataSource;

  TasksRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, bool>> updateTask(Task task) async {
    try {
      var done = await localDataSource.updateTask(task.toModel());
      return Right(done);
    } catch (e) {
      return Left(CachePutFailure());
    }
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

  @override
  Future<Either<Failure, List<Task>>> getTasks() async {
    try {
      var taskModels = await localDataSource.getTasks();
      var tasks = taskModels.map((e) => e.toEntity()).toList();
      return Right(tasks);
    } catch (e) {
      log("$e");
      return Left(CacheGetFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTask(Task task) async {
    try {
      var done = await localDataSource.deleteTask(task.toModel());
      return Right(done);
    } catch (e) {
      return Left(CachePutFailure());
    }
  }
}
