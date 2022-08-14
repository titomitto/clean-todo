import 'package:clean_todo/features/todo/presentation/widgets/todos_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTodoFab extends StatelessWidget {
  const AddTodoFab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: Provider.of<TodosViewModel>(context).increment,
      child: const Icon(Icons.add),
    );
  }
}
