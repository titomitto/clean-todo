import 'package:clean_todo/core/presentation/app_localizations.dart';
import 'package:clean_todo/features/task/presentation/widgets/tasks_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {
  static String get routePath => "/";
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xff14141b),
        title: Text("tasks_title".tr),
      ),
      body: const TasksListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffffd78a),
        foregroundColor: Colors.black,
        onPressed: () => context.push(AddTaskScreen.routePath),
        child: const Icon(Iconsax.add),
      ),
    );
  }
}
