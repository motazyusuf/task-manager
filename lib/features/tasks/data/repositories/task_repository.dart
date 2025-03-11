import 'package:hive/hive.dart';

import '../models/task_model.dart';

class TaskRepository {
  final String id;
  late Box<TaskModel> taskBox;

  TaskRepository(this.id) {
    taskBox = Hive.box<TaskModel>(id);
  }

  Stream<List<TaskModel>> getTasks() {
    return taskBox.watch().map((boxEvent) {
      print("task items count is ${taskBox.length}");
      return taskBox.values.toList();
    });
  }

  Future<void> addTask(TaskModel task) async {
    print("Adding task to Box name: ${taskBox.name}");
    await taskBox.put(task.name, task);
  }

  Future<void> deleteTask(String name) async {
    await taskBox.delete(name);
  }
}
