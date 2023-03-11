import 'package:clean_todo/features/task/domain/usecases/update_task.dart';

class Task {
  int? id;
  String title;
  bool isDone;
  Task({
    this.id,
    required this.title,
    this.isDone = false,
  });

  UpdateTaskParams copyWith({bool? isDone, String? title, int? id}) {
    return UpdateTaskParams(
      task: Task(
        id: id ?? this.id,
        title: title ?? this.title,
        isDone: isDone ?? this.isDone,
      ),
    );
  }
}
