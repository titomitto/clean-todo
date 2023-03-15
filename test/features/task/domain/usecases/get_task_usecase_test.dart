import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/repositories/task_repository.dart';
import 'package:clean_todo/features/task/domain/usecases/get_tasks.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late MockTaskRepository mockTaskRepository;
  late GetTasksUseCase getTasksUseCase;
  setUp(() {
    mockTaskRepository = MockTaskRepository();
    getTasksUseCase = GetTasksUseCase(
      repository: mockTaskRepository,
    );
  });

  var tTasks = [
    Task(
      id: 1,
      title: 'title',
      isDone: false,
    ),
  ];

  test('should get tasks from the repository', () async {
    // arrange
    when(() => mockTaskRepository.getTasks())
        .thenAnswer((_) async => Right(tTasks));
    // act
    final result = await getTasksUseCase();
    // assert
    expect(result, Right(tTasks));
    verify(() => mockTaskRepository.getTasks());
    verifyNoMoreInteractions(mockTaskRepository);
  });
}
