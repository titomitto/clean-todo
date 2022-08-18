import 'package:clean_todo/core/presentation/viewmodels/view_model.dart';
import 'package:clean_todo/features/task/presentation/screens/add_task_screen.dart';
import 'package:flutter/material.dart';

class TasksViewModel extends ViewModel {
  navigate() {
    Navigator.of(context).pushNamed(AddTaskScreen().routeName);
  }
}
