import 'package:clean_todo/features/task/presentation/viewmodels/task_view_model.dart';
import 'package:clean_todo/core/presentation/widgets/view.dart';
import 'package:clean_todo/features/task/domain/entities/task.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

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
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () => viewModel.onCheck(task),
                    behavior: HitTestBehavior.opaque,
                    child: Icon(
                      task.isDone
                          ? EvaIcons.checkmarkSquare2
                          : EvaIcons.squareOutline,
                      color:
                          task.isDone ? const Color(0xffd5ee9b) : Colors.grey,
                      size: 28,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontSize: 18,
                      color: task.isDone ? Colors.grey : Colors.white,
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
