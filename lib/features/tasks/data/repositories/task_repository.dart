import 'package:hive/hive.dart';

import '../models/task_model.dart';

class TaskRepository {
  final String id;
  late Box<Task> taskBox;

  TaskRepository(this.id) {
    taskBox = Hive.box<Task>(id);
  }

  Stream<List<Task>> getTasks() {
    return taskBox.watch().map((event) => taskBox.values.toList());
  }

  Future<void> addTask(Task task) async {
    await taskBox.put(task.name, task);
  }

  Future<void> deleteTask(String name) async {
    await taskBox.delete(name);
  }
}
