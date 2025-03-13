import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/features/tasks/presentation/widgets/update_task_botom_sheet.dart';

import '../../../../core/configs/theme/app_colors.dart';
import '../../data/models/task_model.dart';
import '../manager/task_bloc.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: MyColors.primary,
      title: Text(task.name),
      subtitle: Text(task.description),
      trailing: SizedBox(
        width: 150.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                icon: Icon(Icons.edit, size: 30.r, color: Colors.white60),
                onPressed: () {
                  _showEditTaskBottomSheet(context);
                }),
            IconButton(
                icon: Icon(Icons.delete, size: 30.r, color: Colors.red),
                onPressed: () {
                  context.read<TaskBloc>().add(DeleteTask(task.name));
                }),
          ],
        ),
      ),
    );
  }

  void _showEditTaskBottomSheet(BuildContext parentContext) {
    showModalBottomSheet(
      context: parentContext,
      isScrollControlled: true, // Makes sheet full height
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return UpdateTaskBottomSheet(parentContext: parentContext, task: task);
      },
    );
  }
}
