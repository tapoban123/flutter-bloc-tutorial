import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/to_do_bloc/todo_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/to_do_bloc/todo_events.dart';
import 'package:flutter_bloc_tutorial/blocs/to_do_bloc/todo_states.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  final TextEditingController _newTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do App"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _newTaskController,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                hintText: "Enter task here...",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            IconButton(
              onPressed: () {
                if (_newTaskController.text.isNotEmpty) {
                  context
                      .read<TodoBloc>()
                      .add(AddNewTask(newTask: _newTaskController.text));
                  _newTaskController.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter a task.")));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minimumSize: const Size(double.infinity, 60),
              ),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Tasks",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: BlocBuilder<TodoBloc, TodoStates>(
                builder: (context, state) => ListView.builder(
                  itemCount: state.tasks.length,
                  itemBuilder: (context, index) {
                    final tasks = state.tasks.reversed.toList();
                    final task = tasks[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: ListTile(
                        tileColor: Colors.blueGrey,
                        trailing: IconButton(
                          onPressed: () {
                            context
                                .read<TodoBloc>()
                                .add(DeleteTask(task: task));
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        title: Text(
                          task,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
