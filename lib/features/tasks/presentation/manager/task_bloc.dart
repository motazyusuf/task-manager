import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/task_model.dart';
import '../../data/repositories/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository = TaskRepository();

  TaskBloc() : super(TaskInitial()) {
    on<LoadTasks>(onLoadTask);
    on<AddTask>(onAddTask);
    on<DeleteTask>(onDelete);
    on<_UpdateTasks>(onUpdateTask);
  }

  Future<void> onDelete(event, emit) async {
    await taskRepository.deleteTask(event.name);
  }

  Future<void> onLoadTask(event, emit) async {
    emit(TaskLoaded(taskRepository.getTasks()));
    taskRepository.streamTasks().listen((tasks) {
      add(_UpdateTasks(tasks));
    });
  }

  Future<void> onAddTask(event, emit) async {
    await taskRepository.addTask(event.task);
  }

  onUpdateTask(event, emit) {
    emit(TaskLoaded(event.tasks));
  }
}
