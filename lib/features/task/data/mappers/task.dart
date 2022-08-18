import 'package:clean_todo/features/task/data/models/task.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';

extension ExpenseModelExtension on TaskModel {
  Task toEntity() => Task(
        id: id,
        title: title,
        isDone: isDone,
      );
}

extension ExpenseEntityExtension on Task {
  TaskModel toModel() => TaskModel(
        id: id,
        title: title,
        isDone: isDone,
      );
}
