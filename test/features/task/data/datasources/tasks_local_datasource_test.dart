import 'package:clean_todo/core/errors/exceptions.dart';
import 'package:clean_todo/features/tasks/data/datasources/tasks_local_datasource_impl.dart';
import 'package:clean_todo/features/tasks/data/models/task_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hive/hive.dart';

class MockBox extends Mock implements Box<TaskModel> {}

void main() {
  late TasksLocalDataSourceImpl dataSource;
  late MockBox mockBox;

  setUp(() {
    mockBox = MockBox();
    dataSource = TasksLocalDataSourceImpl(Future.value(mockBox));
  });

  group('getTasks', () {
    final tasks = [
      TaskModel(id: 1, title: 'task 1', isDone: false),
      TaskModel(id: 2, title: 'task 2', isDone: false),
      TaskModel(id: 3, title: 'task 3', isDone: false),
    ];

    test('should return list of tasks when there is data in the box', () async {
      // arrange
      when(() => mockBox.values).thenReturn(tasks);

      // act
      final result = await dataSource.getTasks();

      // assert
      expect(result, tasks);
      verify(() => mockBox.values);
      verifyNoMoreInteractions(mockBox);
    });
  });

  group('addTask', () {
    final taskToAdd = TaskModel(title: 'task 4', isDone: false);

    test('should add task to the box', () async {
      // arrange
      when(() => mockBox.add(taskToAdd)).thenAnswer((_) async => 2);
      when(() => mockBox.put(2, taskToAdd..id = 2)).thenAnswer((_) async => 1);

      // act
      final result = await dataSource.addTask('task 4');

      // assert
      expect(result, true);
      verify(() => mockBox.add(taskToAdd)).called(1);
      verify(() => mockBox.put(2, taskToAdd..id = 2)).called(1);
      verifyNever(() => mockBox.delete(any));
    });

    test('should throw a CacheException when there is an error adding the task',
        () async {
      // arrange
      when(() => mockBox.add(taskToAdd)).thenThrow(Exception());

      // act
      final call = dataSource.addTask;

      // assert
      expect(() => call('task 4'), throwsA(isInstanceOf<CacheException>()));
      verify(() => mockBox.add(taskToAdd));
      verifyNoMoreInteractions(mockBox);
    });
  });

  group('updateTask', () {
    final taskToUpdate =
        TaskModel(id: 2, title: 'updated task 2', isDone: true);

    test('should update task in the box', () async {
      // arrange
      when(() => mockBox.put(taskToUpdate.id, taskToUpdate))
          .thenAnswer((_) async => 1);

      // act
      final result = await dataSource.updateTask(taskToUpdate);

      // assert
      expect(result, true);
      verify(() => mockBox.put(taskToUpdate.id, taskToUpdate)).called(1);
      verifyNoMoreInteractions(mockBox);
    });

    test(
        'should throw a CacheException when there is an error updating the task',
        () async {
      // arrange
      when(() => mockBox.put(taskToUpdate.id, taskToUpdate))
          .thenThrow(Exception());

      // act
      final call = dataSource.updateTask;

      // assert
      expect(() => call(taskToUpdate), throwsA(isInstanceOf<CacheException>()));
      verify(() => mockBox.put(taskToUpdate.id, taskToUpdate));
      verifyNoMoreInteractions(mockBox);
    });

    test('should throw CacheException when deleting a task throws an exception',
        () async {
      // arrange
      final taskModel = TaskModel(id: 1, title: 'test', isDone: false);
      when(() => mockBox.delete(taskModel.id)).thenThrow(Exception());

      // act
      final call = dataSource.deleteTask;

      // assert
      expect(() => call(taskModel), throwsA(isInstanceOf<CacheException>()));
    });

    test('should throw CacheException when updating a task throws an exception',
        () async {
      // arrange
      final taskModel = TaskModel(id: 1, title: 'test', isDone: false);
      when(() => mockBox.put(taskModel.id, taskModel)).thenThrow(Exception());

      // act
      final call = dataSource.updateTask;

      // assert
      expect(() => call(taskModel), throwsA(isInstanceOf<CacheException>()));
    });
  });
}
