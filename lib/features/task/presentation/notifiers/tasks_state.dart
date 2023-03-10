import '../../domain/entities/task.dart';

class TasksState {
  final List<Task> tasks;
  final bool isLoading;
  final bool isSaving;

  TasksState({
    required this.tasks,
    this.isLoading = false,
    this.isSaving = false,
  });

  TasksState copyWith({
    List<Task>? tasks,
    bool? isLoading,
    bool? isSaving,
  }) {
    return TasksState(
      tasks: tasks ?? this.tasks,
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
    );
  }

  TasksState loading() {
    return copyWith(isLoading: true);
  }

  TasksState saving() {
    return copyWith(isSaving: true);
  }
}
