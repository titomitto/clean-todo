import 'package:clean_todo/core/presentation/widgets/view.dart';
import 'package:clean_todo/features/todo/presentation/viewmodels/todo_list_view_model.dart';
import 'package:flutter/material.dart';

class TodoListView extends View<TodoListViewModel> {
  TodoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.red,
          child: const Text("Hello"),
        )
      ],
    );
  }
}
