import 'package:clean_todo/core/presentation/viewmodels/view_model.dart';
import 'package:clean_todo/core/utils/sl.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/usecases/delete_task.dart';
import 'package:clean_todo/features/task/domain/usecases/watch_tasks.dart';

class TasksListViewModel extends ViewModel {
  WatchTasks taskWatcher = sl();
  DeleteTask deleteTask = sl();

  void onDeleteTask(Task task) async {
    await deleteTask(DeleteTaskParams(task: task));
  }
}
