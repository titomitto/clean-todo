import 'dart:developer';

import 'package:clean_todo/core/presentation/viewmodels/view_model.dart';
import 'package:flutter/material.dart';

class AddTodoViewModel extends ViewModel {
  TextEditingController taskController = TextEditingController();

  void addTodo() {
    log("TRUE_TASK ${taskController.text}");
  }
}
