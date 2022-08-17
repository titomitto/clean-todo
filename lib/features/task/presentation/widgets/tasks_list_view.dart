import 'package:clean_todo/core/presentation/widgets/view.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/presentation/viewmodels/tasks_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksListView extends View<TasksListViewModel> {
  TasksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Selector<TasksListViewModel, List<Task>>(
        selector: (context, viewModel) => viewModel.tasks,
        builder: (context, tasks, _) {
          return ListView(
            children: tasks
                .map(
                  (e) => Text(e.title),
                )
                .toList(),
          );
        });
  }
}
