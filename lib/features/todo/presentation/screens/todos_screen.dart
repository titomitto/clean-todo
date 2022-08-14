import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/features/todo/presentation/widgets/add_todo_fab.dart';
import 'package:clean_todo/features/todo/presentation/widgets/todo_list_view.dart';
import 'package:clean_todo/features/todo/presentation/widgets/todos_view_model.dart';
import 'package:flutter/material.dart';

class TodosScreen extends Screen<TodosViewModel> {
  TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: TodoListView(),
      floatingActionButton: const AddTodoFab(),
    );
  }

  @override
  String get routeName => "/todos";
}
