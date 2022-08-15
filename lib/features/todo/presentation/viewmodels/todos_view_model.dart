import 'package:clean_todo/core/presentation/viewmodels/view_model.dart';
import 'package:clean_todo/features/todo/presentation/screens/add_todo_screen.dart';
import 'package:flutter/material.dart';

class TodosViewModel extends ViewModel {
  navigate() {
    Navigator.of(context).pushReplacementNamed(AddTodosScreen().routeName);
  }
}
