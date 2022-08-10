import 'dart:developer';

import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/features/todo/presentation/widgets/add_todo_fab.dart';
import 'package:clean_todo/features/todo/presentation/widgets/todo_list_view.dart';
import 'package:flutter/material.dart';

class TodosScreen extends Screen {
  TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: TodoListView(),
      floatingActionButton: AddTodoFab(),
    );
  }

  @override
  String get routeName => "/todos";
}
