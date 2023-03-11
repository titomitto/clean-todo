import 'package:clean_todo/core/failure/failure.dart';

import '../../domain/entities/task.dart';

class TasksState {
  final List<Task> tasks;
  final bool isLoading;
  final bool isSaving;
  final Failure? failure;

  TasksState({
    required this.tasks,
    this.isLoading = false,
    this.isSaving = false,
    this.failure,
  });

  TasksState copyWith({
    List<Task>? tasks,
    bool? isLoading,
    bool? isSaving,
    Failure? failure,
  }) {
    return TasksState(
      tasks: tasks ?? this.tasks,
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
    );
  }

  TasksState withFailure(Failure failure) {
    return copyWith(
      isLoading: false,
      isSaving: false,
      tasks: [],
      failure: failure,
    );
  }

  TasksState data(List<Task> tasks) {
    return copyWith(isLoading: false, failure: null, tasks: tasks);
  }

  TasksState loading() {
    return copyWith(isLoading: true, isSaving: false, failure: null, tasks: []);
  }

  TasksState saving() {
    return copyWith(isSaving: true, isLoading: false, failure: null);
  }
}
