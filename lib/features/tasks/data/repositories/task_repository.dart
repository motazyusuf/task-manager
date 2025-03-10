import 'package:hive/hive.dart';

import '../models/task_model.dart';

class TaskRepository {
  final String id;
  late Box<TaskModel> taskBox;

  TaskRepository(this.id) {
    print("I am here");
    taskBox = Hive.box<TaskModel>(id);
  }

  Stream<List<TaskModel>> getTasks() {
    return taskBox.watch().map((event) => taskBox.values.toList());
  }

  Future<void> addTask(TaskModel task) async {
    await taskBox.put(task.name, task);
  }

  Future<void> deleteTask(String name) async {
    await taskBox.delete(name);
  }
}
