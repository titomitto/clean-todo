import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/features/task/presentation/viewmodels/add_task_view_model.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends Screen<AddTaskViewModel> {
  AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task List"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: viewModel.taskController,
            decoration: const InputDecoration(
              hintText: "Enter task",
            ),
          ),
          MaterialButton(
            onPressed: viewModel.submit,
            child: const Text("SAVE ME"),
          ),
        ],
      ),
    );
  }

  @override
  String get routeName => "/add-task";
}
