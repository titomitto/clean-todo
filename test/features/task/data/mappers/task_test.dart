import 'package:clean_todo/features/tasks/tasks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExpenseModelExtension', () {
    final taskModel = TaskModel(
      id: 1,
      title: 'Task 1',
      isDone: false,
    );

    test('toEntity() returns a Task entity', () {
      final taskEntity = taskModel.toEntity();

      expect(taskEntity, isA<Task>());
      expect(taskEntity.id, taskModel.id);
      expect(taskEntity.title, taskModel.title);
      expect(taskEntity.isDone, taskModel.isDone);
    });
  });
  group('ExpenseEntityExtension', () {
    const taskEntity = Task(
      id: 1,
      title: 'Task 1',
      isDone: false,
    );

    test('toModel() returns a TaskModel', () {
      final taskModel = taskEntity.toModel();

      expect(taskModel, isA<TaskModel>());
      expect(taskModel.id, taskEntity.id);
      expect(taskModel.title, taskEntity.title);
      expect(taskModel.isDone, taskEntity.isDone);
    });
  });
}
