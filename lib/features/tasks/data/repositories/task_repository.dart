import 'package:hive/hive.dart';

import '../models/task_model.dart';

class TaskRepository {
  late Box<TaskModel> taskBox = Hive.box<TaskModel>("User");

  Stream<List<TaskModel>> streamTasks() {
    return taskBox.watch().map((boxEvent) {
      print("task items count is ${taskBox.length}");
      return taskBox.values.toList();
    });
  }

  List<TaskModel> getTasks() {
    return taskBox.values.toList();
  }

  Future<void> addTask(TaskModel task) async {
    print("Adding task to Box name: ${taskBox.name}");
    await taskBox.put(task.name, task);
  }

  Future<void> deleteTask(String name) async {
    await taskBox.delete(name);
  }
}
