import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/task_model.dart';
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
          _showAddTaskBottomSheet(context);
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

  void _showAddTaskBottomSheet(BuildContext parentContext) {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    showModalBottomSheet(
      context: parentContext,
      isScrollControlled: true, // Makes sheet full height
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Task Name"),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: "Task Description"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  TaskModel task = TaskModel(
                      name: nameController.text,
                      description: descriptionController.text);
                  parentContext.read<TaskBloc>().add(AddTask(task));
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      },
    );
  }
}
