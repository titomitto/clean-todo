import 'dart:developer';

import 'package:clean_todo/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../models/task_model.dart';
import 'tasks_local_datasource.dart';

final tasksLocalDataSourceProvider =
    FutureProvider.autoDispose<TasksLocalDataSource>((ref) async {
  Hive.registerAdapter(TaskModelAdapter());

  Box<TaskModel> box = await Hive.openBox("tasks");

  var tasksLocalDataSource = TasksLocalDataSourceImpl(box);

  ref.onDispose(() {
    tasksLocalDataSource.close();
    log("tasksLocalDataSourceProvider cancelled");
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
  Future<void> deleteTask(TaskModel task) async {
    try {
      await box.delete(task.id);
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
