import 'package:todo/features/domain/entities/todo.dart';

abstract class TodoRepository {
  void addTodo(Todo todo);
  void updateTodo(Todo todo);
  void deleteTodo(String todoId);
  Stream<List<Todo>> getTodoList();
}
