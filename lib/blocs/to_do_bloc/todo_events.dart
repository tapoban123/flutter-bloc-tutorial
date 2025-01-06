import 'package:equatable/equatable.dart';

abstract class TodoEvents extends Equatable {
  const TodoEvents();

  @override
  List<Object?> get props => [];
}

class AddNewTask extends TodoEvents {
  final String newTask;

  const AddNewTask({
    required this.newTask,
  });

  @override
  List<Object?> get props => [newTask];
}

class DeleteTask extends TodoEvents {
  final String task;

  const DeleteTask({
    required this.task,
  });

  @override
  List<Object?> get props => [task];
}
