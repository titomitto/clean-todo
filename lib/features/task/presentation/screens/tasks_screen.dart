import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/features/task/presentation/viewmodels/tasks_view_model.dart';
import 'package:clean_todo/features/task/presentation/widgets/tasks_list_view.dart';
import 'package:flutter/material.dart';

class TasksScreen extends Screen<TasksViewModel> {
  TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Lst"),
      ),
      body: TasksListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.navigate,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  String get routeName => "/";
}
