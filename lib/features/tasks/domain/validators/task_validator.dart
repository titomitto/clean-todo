import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clean_todo/core/core.dart';

var taskValidatorProvider = Provider<TaskValidator>((ref) {
  return TaskValidator();
});

class EmptyFieldFailure implements ValidationFailure {}

class TaskValidator implements Validator<String> {
  static ValidationFailure? validateTitle(String title) {
    if (title.isEmpty) {
      return EmptyFieldFailure();
    }
    return null;
  }

  @override
  ValidationFailure? validate(String title) {
    final titleFailure = validateTitle(title);

    if (titleFailure != null) {
      return titleFailure;
    }

    return null;
  }
}
