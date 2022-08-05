import 'dart:developer';

import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/features/todo/presentation/view_models/todos_view_model.dart';
import 'package:clean_todo/features/todo/presentation/widgets/count_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodosScreen extends Screen<TodosViewModel> {
  TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("COOOLAID");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CountView(),
          CountView(),
          Selector<TodosViewModel, int>(
            selector: (context, viewModel) => viewModel.count,
            builder: (context, count, _) {
              return Center(child: Text("$count"));
            },
          ),
        ],
      ) /* Selector<TodosViewModel, int>(
        selector: (context, viewModel) => viewModel.count,
        builder: (context, count, _) {
          return Center(child: Text("$count"));
        },
      ) */
      ,
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.increment,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  String get routeName => "/todos";
}
