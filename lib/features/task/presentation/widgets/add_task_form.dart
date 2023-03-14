import 'package:clean_todo/features/task/presentation/view_model/tasks_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/task.dart';

class AddTaskForm extends ConsumerStatefulWidget {
  const AddTaskForm({
    super.key,
  });

  @override
  ConsumerState<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends ConsumerState<AddTaskForm> {
  final taskController = TextEditingController();

  void submit() {
    ref.read(tasksControllerProvider.notifier).addTask(taskController.text);
    context.pop();
  }

  @override
  void dispose() {
    super.dispose();
    taskController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: taskController,
            maxLines: 3,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "Enter task",
              hintStyle: TextStyle(
                color: Color(0xff565765),
              ),
              filled: true,
              fillColor: Color(0xff282934),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            minWidth: double.infinity,
            onPressed: submit,
            color: const Color(0xffffd78a),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text("SAVE TASK"),
            ),
          ),
        ],
      ),
    );
  }
}
