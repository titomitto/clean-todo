import 'package:clean_todo/core/core.dart';
import '../models/task_model.dart';

abstract class TasksLocalDataSource implements LocalDataSource {
  Future<List<TaskModel>> getTasks();
  Future<void> addTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(TaskModel task);
}
