import 'package:clean_todo/features/task/presentation/viewmodels/task_view_model.dart';
import 'package:clean_todo/core/presentation/widgets/view.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';

class TaskView extends View<TaskViewModel> {
  final Task task;
  TaskView({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: const BoxDecoration(
          color: Color(0xff282834),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(
                  Iconsax.tick_square5,
                  color: Color(0xffd5ee9b),
                  size: 28,
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Text(
                    task.title,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => viewModel.onDeleteTask(task),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Iconsax.trash,
                color: Colors.grey,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
