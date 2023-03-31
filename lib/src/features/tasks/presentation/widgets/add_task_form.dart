import 'package:clean_todo/features/tasks/presentation/controllers/tasks_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddTaskForm extends ConsumerStatefulWidget {
  const AddTaskForm({
    super.key,
  });

  @override
  ConsumerState<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends ConsumerState<AddTaskForm> {
  final taskTitleController = TextEditingController();

  void submit() {
    final taskController = ref.read(tasksProvider.notifier);
    taskController.addTask(taskTitleController.text.trim());
    context.pop();
  }

  @override
  void dispose() {
    super.dispose();
    taskTitleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: taskTitleController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.taskTitleHint,
              hintStyle: const TextStyle(
                color: Color(0xff565765),
              ),
              filled: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            minWidth: double.infinity,
            onPressed: submit,
            color: const Color(0xffffd78a),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(AppLocalizations.of(context)!.saveTaskButton),
            ),
          ),
        ],
      ),
    );
  }
}
