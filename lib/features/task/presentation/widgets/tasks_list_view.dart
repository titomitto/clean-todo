import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/tasks_state_notifier.dart';
import 'task_view.dart';

class TasksListView extends ConsumerStatefulWidget {
  const TasksListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TasksListViewState();
}

class _TasksListViewState extends ConsumerState<TasksListView> {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(tasksStateNotifierProvider.notifier).getTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    var tasksState = ref.watch(tasksStateNotifierProvider);
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      color: const Color(0xff14141b),
      child: tasksState.when(data: (tasks) {
        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            var task = tasks[index];
            return TaskView(task: task);
          },
        );
      }, error: (error, stackTrace) {
        return Center(
          child: Text(
            "Error: $error",
            style: const TextStyle(color: Colors.white),
          ),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
