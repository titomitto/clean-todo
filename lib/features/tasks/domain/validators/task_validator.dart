import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:clean_todo/core/core.dart';
import '../entities/task.dart';

var taskValidatorProvider = Provider<TaskValidator>((ref) {
  return TaskValidator();
});

class EmptyFieldError implements ValidationError {}

class TaskValidator implements Validator<Task> {
  static ValidationError? validateTitle(String title) {
    if (title.isEmpty) {
      return EmptyFieldError();
    }
    return null;
  }

  @override
  ValidationFailure? validate(Task task) {
    final errors = <String, ValidationError>{};
    final titleError = validateTitle(task.title);

    if (titleError != null) {
      errors['title'] = titleError;
    }

    if (errors.isNotEmpty) {
      return ValidationFailure(errors);
    }

    return null;
  }
}
