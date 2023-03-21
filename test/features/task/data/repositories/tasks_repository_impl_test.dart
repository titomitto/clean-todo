import 'package:clean_todo/core/datasource/local_data_source.dart';
import 'package:clean_todo/features/tasks/data/repositories/tasks_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalDataSource extends Mock implements LocalDataSource {}

void main() {
  late TasksRepositoryImpl tasksRepository;
  late LocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    //tasksRepository = TasksRepositoryImpl( mockLocalDataSource);
  });
}
