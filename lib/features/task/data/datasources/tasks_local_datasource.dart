import 'dart:developer';

import 'package:clean_todo/core/failure/exceptions.dart';
import 'package:clean_todo/features/task/data/models/task.dart';
import 'package:hive/hive.dart';

abstract class TasksLocalDataSource {
  Stream<List<TaskModel>> watchTasks();
  Future<List<TaskModel>> getTasks();
  Future<bool> addTask(TaskModel task);
  Future<bool> updateTask(TaskModel task);
  Future<bool> deleteTask(TaskModel task);
}

class TasksLocalDataSourceImpl extends TasksLocalDataSource {
  late Box<TaskModel> box;

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
      throw CacheException();
    }
  }

  Future<TasksLocalDataSourceImpl> init() async {
    try {
      box = await Hive.openBox("tasks");
      return this;
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Stream<List<TaskModel>> watchTasks() async* {
    yield await getTasks();
    yield await box.watch().map((event) => event.value as TaskModel).toList();
  }
}
