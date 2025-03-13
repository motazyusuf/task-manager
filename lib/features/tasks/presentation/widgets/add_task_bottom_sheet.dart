import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/widgets/space.dart';
import '../../data/models/task_model.dart';
import '../manager/task_bloc.dart';

class AddTaskBottomSheet extends StatelessWidget {
  AddTaskBottomSheet({super.key, required this.parentContext});

  final BuildContext parentContext;
  TextEditingController nameController = TextEditingController();
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
          verticalSpace(16),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: MyStrings.taskName),
          ),
          verticalSpace(8),
          TextField(
            controller: descriptionController,
            decoration:
                const InputDecoration(labelText: MyStrings.taskDescription),
          ),
          verticalSpace(16),
          ElevatedButton(
            onPressed: () {
              TaskModel task = TaskModel(
                  name: nameController.text,
                  description: descriptionController.text);
              parentContext.read<TaskBloc>().add(AddTask(task));
              Navigator.pop(context);
            },
            child: const Text(MyStrings.ok),
          ),
        ],
      ),
    );
  }
}
