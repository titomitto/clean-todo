import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String title;

  @HiveField(2, defaultValue: false)
  bool isDone;

  bool fromServer;

  bool hasSynced;

  TaskModel({
    this.id,
    required this.title,
    required this.isDone,
    this.fromServer = false,
    this.hasSynced = false,
  });
}
