import 'package:todo/core/use_cases.dart';
import 'package:todo/features/domain/repository/todo_repository.dart';

class DeleteTodo implements UseCase<void, String> {
  final TodoRepository todoRepository;

  DeleteTodo(this.todoRepository);

  @override
  void call(String todoId) {
    todoRepository.deleteTodo(todoId);
  }
}
