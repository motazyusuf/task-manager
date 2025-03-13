import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/core/services/my_functions.dart';

import '../manager/task_bloc.dart';
import '../widgets/my_list_tile.dart';

class TasksScreen extends StatefulWidget {
  TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  var tasks = [];

  @override
  void initState() {
    BlocProvider.of<TaskBloc>(context).add(LoadTasks());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MyFunctions.showAddTaskBottomSheet(context);
        },
        backgroundColor: Colors.red, // Change color
        child:
            const Icon(Icons.add, color: Colors.white60), // Icon inside button
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoaded) {
            tasks = state.tasks;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: tasks.isEmpty
                      ? const SizedBox()
                      : ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            final task = tasks[index];
                            return MyListTile(task: task);
                          },
                        ),
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
