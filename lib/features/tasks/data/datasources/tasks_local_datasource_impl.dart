import 'dart:developer';

import 'package:clean_todo/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../models/task_model.dart';
import 'tasks_local_datasource.dart';

class TasksLocalDataSourceImpl extends TasksLocalDataSource {
  final Future<Box<TaskModel>> getBox;

  TasksLocalDataSourceImpl(this.getBox);

  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      final box = await getBox;
      return box.values.toList();
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<bool> addTask(String title) async {
    try {
      final box = await getBox;
      final task = TaskModel(
        title: title,
        isDone: false,
      );
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
      final box = await getBox;
      await box.delete(task.id);
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<bool> updateTask(TaskModel task) async {
    try {
      final box = await getBox;
      await box.put(task.id, task);
      return true;
    } catch (e) {
      log("$e");
      throw CacheException();
    }
  }

  @override
  Future<void> clear() async {
    final box = await getBox;
    await box.clear();
  }
}

final tasksBoxProvider =
    FutureProvider.autoDispose<Box<TaskModel>>((ref) async {
  Box<TaskModel> box = await Hive.openBox("tasks");
  ref.onDispose(() {
    box.close();
    log("tasksBoxProvider disposed");
  });
  return box;
});

final tasksLocalDataSourceProvider =
    Provider.autoDispose<TasksLocalDataSource>((ref) {
  final box = ref.watch(tasksBoxProvider.future);
  return TasksLocalDataSourceImpl(box);
});
