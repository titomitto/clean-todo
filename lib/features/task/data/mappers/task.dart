import 'package:clean_todo/features/task/data/models/todo_model.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';

extension ExpenseModelExtension on TaskModel {
  Task toEntity() => Task(
        id: id,
        title: title,
      );
}

extension ExpenseEntityExtension on Task {
  TaskModel toModel() => TaskModel(
        id: id,
        title: title,
      );
}
