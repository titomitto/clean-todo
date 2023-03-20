import 'dart:developer';

import 'package:clean_todo/core/errors/exceptions.dart';
import 'package:clean_todo/features/task/data/datasources/tasks_local_datasource.dart';
import 'package:clean_todo/features/task/data/models/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final tasksLocalDataSourceProvider =
    FutureProvider.autoDispose<TasksLocalDataSource>((ref) async {
  Hive.registerAdapter(TaskModelAdapter());
  Box<TaskModel> box = await Hive.openBox("tasks");
  var tasksLocalDataSource = TasksLocalDataSourceImpl(box);

  ref.onDispose(() {
    tasksLocalDataSource.close();
  });

  return tasksLocalDataSource;
});

class TasksLocalDataSourceImpl extends TasksLocalDataSource {
  final Box<TaskModel> box;

  TasksLocalDataSourceImpl(this.box);

  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      return box.values.toList();
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<bool> addTask(TaskModel task) async {
    try {
      int id = await box.add(task);
      await box.put(id, task..id = id);
      return true;
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<bool> deleteTask(TaskModel task) async {
    try {
      await box.delete(task.id);
      return true;
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<bool> updateTask(TaskModel task) async {
    try {
      await box.put(task.id, task);
      return true;
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<void> clear() async {
    await box.clear();
  }

  @override
  Future<void> close() async {
    await box.close();
  }
}
