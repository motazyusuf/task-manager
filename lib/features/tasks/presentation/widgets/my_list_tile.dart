import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/configs/theme/app_colors.dart';
import '../manager/task_bloc.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.task,
  });

  final dynamic task;

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
                  context.read<TaskBloc>().add(DeleteTask(task.name));
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
}
