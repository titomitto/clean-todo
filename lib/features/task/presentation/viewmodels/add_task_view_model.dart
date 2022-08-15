import 'package:clean_todo/core/presentation/viewmodels/view_model.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/usecases/add_task.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AddTaskViewModel extends ViewModel {
  TextEditingController taskController = TextEditingController();
  var addTodo = GetIt.I<AddTask>();

  void submit() {
    addTodo(AddTaskParams(
      task: Task(
        title: taskController.text,
      ),
    ));
  }
}
