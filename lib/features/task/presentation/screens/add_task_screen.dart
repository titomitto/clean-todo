import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/features/task/presentation/viewmodels/add_task_view_model.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends Screen<AddTaskViewModel> {
  AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xff14141b),
        title: const Text("Add Task List"),
      ),
      body: Container(
        color: const Color(0xff14141b),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: viewModel.taskController,
              maxLines: 3,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Enter task",
                hintStyle: TextStyle(
                  color: Color(0xff565765),
                ),
                filled: true,
                fillColor: Color(0xff282934),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              minWidth: double.infinity,
              onPressed: viewModel.submit,
              color: const Color(0xffffd78a),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text("SAVE TASK"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  String get routeName => "/add-task";
}
