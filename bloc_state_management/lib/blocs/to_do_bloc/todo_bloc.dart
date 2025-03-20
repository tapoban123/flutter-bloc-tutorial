import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/to_do_bloc/todo_events.dart';
import 'package:flutter_bloc_tutorial/blocs/to_do_bloc/todo_states.dart';

class TodoBloc extends Bloc<TodoEvents, TodoStates> {
  TodoBloc() : super(const TodoStates()) {
    on<AddNewTask>(_addNewTask);
    on<DeleteTask>(_deleteTask);
  }

  void _addNewTask(AddNewTask event, Emitter emit) {
    emit(state.copyWith(tasks: [...state.tasks, event.newTask]));
  }

  void _deleteTask(DeleteTask event, Emitter emit) {
    final List<String> newtasks = List.from(state.tasks);

    newtasks.remove(event.task);

    emit(state.copyWith(tasks: newtasks));
  }
}
