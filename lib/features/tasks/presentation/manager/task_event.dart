part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

class LoadTasks extends TaskEvent {}

class AddTask extends TaskEvent {
  final TaskModel task;
  AddTask(this.task);
}

class DeleteTask extends TaskEvent {
  final String name;
  DeleteTask(this.name);
}

class _UpdateTasks extends TaskEvent {
  final List<TaskModel> tasks;
  _UpdateTasks(this.tasks);
}
