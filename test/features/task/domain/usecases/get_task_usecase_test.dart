import 'package:clean_todo/features/tasks/domain/entities/task.dart';
import 'package:clean_todo/features/tasks/domain/repositories/task_repository.dart';
import 'package:clean_todo/features/tasks/domain/usecases/get_tasks.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTaskRepository extends Mock implements TasksRepository {}

void main() {
  late MockTaskRepository mockTaskRepository;
  late GetTasks getTasksUseCase;
  setUp(() {
    mockTaskRepository = MockTaskRepository();
    getTasksUseCase = GetTasks(
      repository: mockTaskRepository,
    );
  });

  const tTasks = [
    Task(
      id: 1,
      title: 'title',
      isDone: false,
    ),
  ];

  test('should get tasks from the repository', () async {
    // arrange
    when(() => mockTaskRepository.getTasks())
        .thenAnswer((_) async => const Right(tTasks));
    // act
    final result = await getTasksUseCase();
    // assert
    expect(result, const Right(tTasks));
    verify(() => mockTaskRepository.getTasks());
    verifyNoMoreInteractions(mockTaskRepository);
  });
}
