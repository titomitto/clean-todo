import 'package:clean_todo/features/tasks/data/models/task_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TaskModel', () {
    test('TaskModel can be created', () {
      final task = TaskModel(
        id: 1,
        title: 'Task 1',
        isDone: false,
      );

      expect(task, isA<TaskModel>());
      expect(task.id, 1);
      expect(task.title, 'Task 1');
      expect(task.isDone, false);
    });
  });
}
