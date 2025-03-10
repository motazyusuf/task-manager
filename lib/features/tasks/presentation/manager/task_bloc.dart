import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/task_model.dart';
import '../../data/repositories/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;

  TaskBloc(this.taskRepository) : super(TaskLoading()) {
    on<LoadTasks>((event, emit) {
      taskRepository.getTasks().listen((tasks) {
        add(_UpdateTasks(tasks)); // Internally updating state
      });
    });

    on<AddTask>((event, emit) async {
      await taskRepository.addTask(event.task);
    });

    on<DeleteTask>((event, emit) async {
      await taskRepository.deleteTask(event.name);
    });

    on<_UpdateTasks>((event, emit) {
      emit(TaskLoaded(event.tasks));
    });
  }
}

// for the LoadTask
class _UpdateTasks extends TaskEvent {
  final List<Task> tasks;

  _UpdateTasks(this.tasks);
}