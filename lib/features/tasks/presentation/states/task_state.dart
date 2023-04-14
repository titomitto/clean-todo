import '../../../../core/core.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskSaving extends TaskState {}

class TaskAdded extends TaskState {}

class TaskDeleted extends TaskState {}

class TaskUpdated extends TaskState {}

class TaskError extends TaskState {
  final Failure failure;
  TaskError(this.failure);
}
