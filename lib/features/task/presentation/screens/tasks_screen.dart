import 'package:clean_todo/core/presentation/app_localizations.dart';
import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/features/task/presentation/viewmodels/tasks_view_model.dart';
import 'package:clean_todo/features/task/presentation/widgets/tasks_list_view.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TasksScreen extends Screen<TasksViewModel> {
  TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xff14141b),
        title: Text("tasks_title".tr(context)),
      ),
      body: TasksListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffffd78a),
        foregroundColor: Colors.black,
        onPressed: viewModel.navigate,
        child: const Icon(Iconsax.add),
      ),
    );
  }

  @override
  String get routeName => "/";
}
