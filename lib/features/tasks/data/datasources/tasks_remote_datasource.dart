import 'package:clean_todo/core/core.dart';
import '../models/task_model.dart';

abstract class RemoteLocalDataSource implements LocalDataSource {
  Future<List<TaskModel>> getTasks();
  Future<void> addTask(String title);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(TaskModel task);
}
