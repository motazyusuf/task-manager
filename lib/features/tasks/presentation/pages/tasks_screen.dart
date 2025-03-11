import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/core/configs/theme/text_theme.dart';
import 'package:task_manager/features/tasks/data/repositories/task_repository.dart';

import '../../data/models/task_model.dart';
import '../manager/task_bloc.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Question
      create: (context) => TaskBloc(TaskRepository(user!.uid)),
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                if (state is TaskLoaded) {
                  final tasks = state.tasks;
                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return ListTile(
                        title: Text(task.name),
                        subtitle: Text(task.description),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => context
                              .read<TaskBloc>()
                              .add(DeleteTask(task.name)),
                        ),
                      );
                    },
                  );
                }
                return Center(
                    child: Text(
                  "No tasks available",
                  style: MyTextStyle.onBackgroundBold12,
                ));
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                final task = TaskModel(
                    name: "New Task", description: "Task description");
                BlocProvider.of<TaskBloc>(context).add(AddTask(task));
              },
              child: const Icon(Icons.add))
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: MyColors.secondaryAccent,
      //   onPressed: () {
      //     final task =
      //         TaskModel(name: "New Task", description: "Task description");
      //     BlocProvider.of<TaskBloc>(context).add(AddTask(task));
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
