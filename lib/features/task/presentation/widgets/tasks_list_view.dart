import 'package:clean_todo/core/presentation/widgets/view.dart';
import 'package:clean_todo/features/task/presentation/viewmodels/tasks_list_view_model.dart';
import 'package:flutter/material.dart';

class TasksListView extends View<TasksListViewModel> {
  TasksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: viewModel.tasks
          .map(
            (e) => Text("${e.title}"),
          )
          .toList(),
    );
  }
}
