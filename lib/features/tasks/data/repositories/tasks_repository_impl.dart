import 'dart:developer';

import 'package:clean_todo/core/core.dart';
import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/tasks/data/datasources/tasks_local_datasource.dart';
import 'package:clean_todo/features/tasks/data/mappers/task.dart';
import 'package:clean_todo/features/tasks/domain/entities/task.dart';
import 'package:clean_todo/features/tasks/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/tasks_local_datasource_impl.dart';
import '../models/task_model.dart';

class TasksRepositoryImpl extends TasksRepository {
  final TasksLocalDataSource localDataSource;

  TasksRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Unit>> updateTask(Task task) async {
    try {
      await localDataSource.updateTask(task.toModel());
      return const Right(unit);
    } catch (e) {
      return Left(CachePutFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> createTask(String title) async {
    try {
      var task = TaskModel(title: title, isDone: false);
      await localDataSource.addTask(task);
      return const Right(unit);
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
  Future<Either<Failure, Unit>> deleteTask(Task task) async {
    try {
      await localDataSource.deleteTask(task.toModel());
      return const Right(unit);
    } catch (e) {
      return Left(CachePutFailure());
    }
  }
}

final tasksRepositoryProvider = Provider.autoDispose<TasksRepository>((ref) {
  final tasksLocalDataSource = ref.watch(tasksLocalDataSourceProvider);
  return TasksRepositoryImpl(localDataSource: tasksLocalDataSource);
});
