import 'package:clean_todo/core/usecases/usecase.dart';
import 'package:clean_todo/core/errors/failures.dart';
import 'package:clean_todo/features/tasks/data/repositories/tasks_repository_impl.dart';
import 'package:clean_todo/features/tasks/domain/repositories/task_repository.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../validators/task_validator.dart';

class AddTaskParams {
  String title;
  AddTaskParams({
    required this.title,
  });
}

class AddTask extends UseCase<void, AddTaskParams> {
  TasksRepository repository;
  TaskValidator validator;

  AddTask({
    required this.repository,
    required this.validator,
  });

  @override
  Future<Either<Failure, void>> call(AddTaskParams params) async {
    ValidationFailure? validationFailure = validator.validate(params);

    if (validationFailure != null) {
      return Left(validationFailure);
    }

    return repository.createTask(params.title);
  }
}

final addTaskUseCaseProvider = Provider<AddTask>((ref) {
  final validator = TaskValidator();
  final repository = ref.read(tasksRepositoryProvider);
  return AddTask(
    repository: repository,
    validator: validator,
  );
});
