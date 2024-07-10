import 'package:todo/core/use_cases.dart';
import 'package:todo/features/domain/entities/todo.dart';
import 'package:todo/features/domain/repository/todo_repository.dart';

class UpdateTodo implements UseCase<void, Todo> {
  final TodoRepository todoRepository;

  UpdateTodo(this.todoRepository);

  @override
  void call(Todo todo) async {
    todoRepository.updateTodo(todo);
  }
}
