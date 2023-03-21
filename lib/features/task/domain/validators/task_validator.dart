import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/shared/validator.dart';
import '../entities/task.dart';

var taskValidatorProvider = Provider<TaskValidator>((ref) {
  return TaskValidator();
});

class TaskValidator implements Validator<Task> {
  @override
  List<ValidationError> validate(Task task) {
    final errors = <ValidationError>[];
    if (task.title.isEmpty) {
      errors.add(ValidationError('title', 'Title cannot be empty'));
    }
    return errors;
  }
}
