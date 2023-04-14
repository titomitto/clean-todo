import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../tasks.dart';
import '../controllers/task_controller.dart';
import '../states/task_state.dart';

class AddTaskForm extends ConsumerStatefulWidget {
  const AddTaskForm({
    super.key,
  });

  @override
  ConsumerState<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends ConsumerState<AddTaskForm> {
  final formKey = GlobalKey<FormState>();
  final taskTitleController = TextEditingController();

  void submit() {
    final taskController = ref.read(taskProvider.notifier);
    taskController.saveTask(taskTitleController.text.trim());
  }

  String mapValidationErrorToMessage(context, ValidationError error) {
    if (error is EmptyFieldError) {
      return AppLocalizations.of(context)!.emptyFieldError;
    }
    return AppLocalizations.of(context)!.somethingWentWrong;
  }

  void navigateBack() {
    context.pop();
  }

  @override
  void dispose() {
    super.dispose();
    taskTitleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(taskProvider, (prevState, state) {
      if (state is TaskAdded) {
        navigateBack();
      }
    });

    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: taskTitleController,
            maxLines: 3,
            validator: (value) {
              final error = TaskValidator.validateTitle(value!);
              if (error != null) {
                return mapValidationErrorToMessage(context, error);
              }
              return null;
            },
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
            onPressed: () {
              if (formKey.currentState!.validate()) submit();
            },
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
