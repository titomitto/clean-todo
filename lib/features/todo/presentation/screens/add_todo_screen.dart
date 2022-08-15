import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/features/todo/presentation/viewmodels/add_todo_view_model.dart';
import 'package:flutter/material.dart';

class AddTodosScreen extends Screen<AddTodoViewModel> {
  AddTodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo List"),
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
            onPressed: viewModel.addTodo,
            child: const Text("SAVE ME"),
          ),
        ],
      ),
    );
  }

  @override
  String get routeName => "/add-todos";
}
