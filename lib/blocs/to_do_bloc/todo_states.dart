import 'package:equatable/equatable.dart';

class TodoStates extends Equatable {
  final List<String> tasks;

  const TodoStates({
    this.tasks = const [],
  });

  TodoStates copyWith({List<String>? tasks}) {
    return TodoStates(
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object?> get props => [tasks];
}
