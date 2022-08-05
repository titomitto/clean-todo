import 'package:clean_todo/core/presentation/widgets/view.dart';
import 'package:clean_todo/features/todo/presentation/view_models/todos_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountView extends View<TodosViewModel> {
  CountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${context.select((TodosViewModel m) => m.count)}"),
              GoonsView(),
            ],
          ),
        ),
        Container(
          child: MaterialButton(
            onPressed: viewModel.increment,
            child: Text("ADD +"),
          ),
        )
      ]),
    );
  }
}

class GoonsView extends View<TodosViewModel> {
  GoonsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        Expanded(
          child:
              Text(" YIKES ${context.select((TodosViewModel m) => m.count)}"),
        ),
        Container(
          child: MaterialButton(
            onPressed: viewModel.increment,
            child: Text("ADD*"),
          ),
        )
      ]),
    );
  }
}
