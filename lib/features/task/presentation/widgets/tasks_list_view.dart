import 'package:dartz/dartz.dart' hide Task;
import 'package:clean_todo/core/failure/failure.dart';
import 'package:clean_todo/core/presentation/widgets/view.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:clean_todo/features/task/presentation/viewmodels/tasks_list_view_model.dart';
import 'package:flutter/material.dart';

import 'task_view.dart';

class TasksListView extends View<TasksListViewModel> {
  TasksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      color: const Color(0xff14141b),
      child: StreamBuilder<Either<Failure, List<Task>>>(
        // stream: viewModel.taskWatcher(),
        builder: ((context, snapshot) {
          var data = snapshot.data;
          return data != null
              ? data.fold<Widget>(
                  (l) => Center(child: Text(l.msg)),
                  (r) => ListView.builder(
                        itemCount: r.length,
                        itemBuilder: (context, index) {
                          var task = r[index];
                          return TaskView(task: task);
                        },
                      ))
              : const SizedBox();
        }),
      ),
    );
  }
}
