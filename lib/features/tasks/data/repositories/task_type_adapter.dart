import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_manager/features/tasks/data/models/task_model.dart';

class TaskTypeAdapter extends TypeAdapter<TaskModel> {
  @override
  TaskModel read(BinaryReader reader) {
    // TODO: implement read
    return TaskModel(
        name: reader.readString(), description: reader.readString());
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.description);
    // TODO: implement write
  }
}
