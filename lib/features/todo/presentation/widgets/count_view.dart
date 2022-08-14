import 'package:clean_todo/core/presentation/widgets/view.dart';
import 'package:clean_todo/features/todo/presentation/widgets/todos_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountView extends View<TodosViewModel> {
  CountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Selector<TodosViewModel, int>(
            selector: (p0, p1) => p1.count,
            builder: (context, count, _) {
              return Text(
                "My Count $count",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              );
            }),
        MaterialButton(
          onPressed: Provider.of<TodosViewModel>(context).increment,
          child: const Text("ADD IT!"),
        ),
      ],
    );
  }
}
