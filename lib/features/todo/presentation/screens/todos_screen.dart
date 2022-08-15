import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/features/todo/presentation/widgets/todo_list_view.dart';
import 'package:clean_todo/features/todo/presentation/viewmodels/todos_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodosScreen extends Screen<TodosViewModel> {
  TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Lst"),
      ),
      body: TodoListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.navigate,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  String get routeName => "/";
}
