// ignore_for_file: unused_import

import 'dart:developer';

import 'package:clean_todo/core/presentation/viewmodels/view_model.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/domain/usecases/add_task.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class AddTaskViewModel extends ViewModel {
  TextEditingController taskController = TextEditingController();
  var addTodo = GetIt.I<AddTask>();

  void submit() async {
    var response = await addTodo(AddTaskParams(
      task: Task(
        title: taskController.text,
      ),
    ));

    response.fold((l) => log("LEFT ${l.msg}"), (r) {
      log("RIGHT $r");
      Navigator.of(context).pop();
    });
  }
}
