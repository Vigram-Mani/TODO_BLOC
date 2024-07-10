import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/domain/entities/todo.dart';
import 'package:todo/features/presentation/bloc/todo_bloc.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    return AlertDialog(
      title: const Text('Add Todo'),
      content: TextField(
        controller: titleController,
        decoration: const InputDecoration(hintText: 'Todo title'),
      ),
      actions: [
        ElevatedButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ElevatedButton(
          child: const Text('Add'),
          onPressed: () {
            final todo = Todo(
              id: DateTime.now().toString(),
              title: titleController.text,
              completed: false,
            );
            context.read<TodoBloc>().add(AddTodoEvent(todo));
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
