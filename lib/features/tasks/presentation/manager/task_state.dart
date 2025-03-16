part of 'task_bloc.dart';

@immutable
sealed class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoaded extends TaskState {
  final List<TaskModel> tasks;
  TaskLoaded(this.tasks);
}