import 'package:clean_todo/features/tasks/domain/entities/task.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Task', () {
    test('should be a subclass of Equatable', () async {
      // Arrange
      const tTask = Task(id: 1, title: 'Test Task', isDone: true);

      // Assert
      expect(tTask, isA<Equatable>());
    });

    test('Task can be created', () async {
      // Arrange
      const tTask = Task(id: 1, title: 'Test Task', isDone: true);

      // Assert
      expect(tTask.id, 1);
      expect(tTask.title, 'Test Task');
      expect(tTask.isDone, true);
    });
  });
}
