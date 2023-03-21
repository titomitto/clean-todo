import 'package:clean_todo/core/core.dart';
import '../models/task_model.dart';

abstract class TasksLocalDataSource implements LocalDataSource {
  Future<List<TaskModel>> getTasks();
  Future<bool> addTask(TaskModel task);
  Future<bool> updateTask(TaskModel task);
  Future<bool> deleteTask(TaskModel task);
}
