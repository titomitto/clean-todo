import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class TaskModel implements Task {
  @override
  @HiveField(0)
  String title;

  TaskModel({
    required this.title,
  });
}
