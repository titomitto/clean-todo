import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final bool isDone;
  const Task({
    this.id,
    required this.title,
    this.isDone = false,
  });

  @override
  List<Object?> get props => [id, title];
}
