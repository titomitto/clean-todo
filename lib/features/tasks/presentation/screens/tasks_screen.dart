import 'package:clean_todo/features/preferences/presentation/screens/preferences_screen.dart';
import 'package:clean_todo/features/tasks/presentation/widgets/tasks_list_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../preferences/presentation/widgets/change_language_button.dart';
import '../../../preferences/presentation/widgets/change_theme_button.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {
  static String get routePath => "/";
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(AppLocalizations.of(context)!.listTasksScreenTitle),
        actions: const [
          ChangeLanguageButton(),
          AppThemeButton(),
        ],
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
