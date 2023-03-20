import 'dart:developer';

import 'package:clean_todo/core/errors/exceptions.dart';
import 'package:clean_todo/features/task/data/models/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../core/datasource/local_data_source.dart';

abstract class TasksLocalDataSource implements LocalDataSource {
  Future<List<TaskModel>> getTasks();
  Future<bool> addTask(TaskModel task);
  Future<bool> updateTask(TaskModel task);
  Future<bool> deleteTask(TaskModel task);
}
