import 'package:clean_todo/core/presentation/widgets/view.dart';
import 'package:clean_todo/features/todo/presentation/view_models/add_todo_view_model.dart';
import 'package:flutter/material.dart';

class AddTodoFab extends View<AddTodoViewModel> {
  AddTodoFab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: viewModel.onAddTodo,
      child: const Icon(Icons.add),
    );
  }
}
