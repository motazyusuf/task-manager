import 'package:hive/hive.dart';

import '../models/task_model.dart';

class TaskRepository {
  final Box<Task> taskBox = Hive.box<Task>('tasksBox');

  Stream<List<Task>> watchTasks() {
    return taskBox.watch().map((event) => taskBox.values.toList());
  }

  Future<void> addTask(Task task) async {
    await taskBox.put(task.name, task);
  }

  Future<void> deleteTask(String name) async {
    await taskBox.delete(name);
  }
}
