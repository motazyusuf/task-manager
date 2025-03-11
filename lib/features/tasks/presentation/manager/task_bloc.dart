import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/task_model.dart';
import '../../data/repositories/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository = TaskRepository();

  TaskBloc() : super(TaskInitial()) {
    on<LoadTasks>((event, emit) {
      taskRepository.getTasks().listen((tasks) {
        add(_UpdateTasks(tasks)); // Internally updating state
      });
    });

    on<AddTask>(onAddTask);
    on<DeleteTask>(onDelete);
    on<_UpdateTasks>((event, emit) {
      emit(TaskLoaded(event.tasks));
    });
  }

  Future<void> onDelete(
    DeleteTask event,
    Emitter emit,
  ) async {
    taskRepository.deleteTask(event.name);
  }

  // Future<void> onLoadTask(event,emit) async {
  //   taskRepository.getTasks().listen((tasks) {
  //     add(_UpdateTasks(tasks)); // Internally updating state
  //   });
  // }

  Future<void> onAddTask(event, emit) async {
    taskRepository.addTask(event.task);
  }
}

