import 'package:clean_todo/features/tasks/presentation/widgets/tasks_list_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        title: Text(AppLocalizations.of(context)!.helloWorld),
      ),
      body: const TasksListView(),
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: const Color(0xffffd78a),
        foregroundColor: Colors.black,
        onPressed: () => context.push(AddTaskScreen.routePath),
        child: const Icon(Iconsax.add),
      ),
    );
  }
}
