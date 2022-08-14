import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/features/todo/presentation/widgets/add_todo_fab.dart';
import 'package:clean_todo/features/todo/presentation/widgets/count_view.dart';
import 'package:clean_todo/features/todo/presentation/widgets/todos_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodosScreen extends Screen<TodosViewModel> {
  TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: Column(children: [
        CountView(),
        CountView(),
        Selector<TodosViewModel, int>(
            selector: (p0, p1) => p1.count,
            builder: (context, count, _) {
              return Text(
                "$count",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              );
            })
      ]),
      /* TodoListView() */
      floatingActionButton: const AddTodoFab(),
    );
  }

  @override
  String get routeName => "/todos";
}
