import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/features/todo/presentation/view_models/todos_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class TodosScreen extends Screen<TodosViewModel> {
  TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Selector<TodosViewModel, int>(
          selector: (context, viewModel) => viewModel.count,
          builder: (context, count, _) {
            return Text("${viewModel.count}");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.increment,
      ),
    );
  }

  @override
  String get routeName => "/todos";
}
