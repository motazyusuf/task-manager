import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/strings.dart';
import '../../data/models/task_model.dart';
import '../manager/task_bloc.dart';

class UpdateTaskBottomSheet extends StatelessWidget {
  UpdateTaskBottomSheet(
      {super.key, required this.task, required this.parentContext});

  final TaskModel task;
  final BuildContext parentContext;

  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: 16.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          TextField(
            controller: descriptionController,
            decoration:
                InputDecoration(labelText: MyStrings.editTaskDescription.tr()),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              task.description = descriptionController.text;
              parentContext.read<TaskBloc>().add(AddTask(task));
              Navigator.pop(context);
            },
            child: Text(MyStrings.ok.tr()),
          ),
        ],
      ),
    );
  }
}
