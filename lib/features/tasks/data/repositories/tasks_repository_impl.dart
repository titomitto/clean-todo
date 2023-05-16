import 'dart:developer';

import 'package:clean_todo/core/core.dart';
import 'package:clean_todo/core/errors/failures.dart';
import 'package:clean_todo/features/tasks/data/datasources/tasks_local_datasource.dart';
import 'package:clean_todo/features/tasks/data/mappers/task.dart';
import 'package:clean_todo/features/tasks/domain/entities/task.dart';
import 'package:clean_todo/features/tasks/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../datasources/tasks_local_datasource_impl.dart';

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
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> createTask(String title) async {
    try {
      await localDataSource.addTask(title);
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure());
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
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTask(Task task) async {
    try {
      await localDataSource.deleteTask(task.toModel());
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}

final tasksRepositoryProvider = Provider.autoDispose<TasksRepository>((ref) {
  final tasksLocalDataSource = ref.watch(tasksLocalDataSourceProvider);
  return TasksRepositoryImpl(localDataSource: tasksLocalDataSource);
});
