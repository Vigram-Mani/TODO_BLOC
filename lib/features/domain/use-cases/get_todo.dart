import 'package:todo/core/use_cases.dart';
import 'package:todo/features/domain/entities/todo.dart';
import 'package:todo/features/domain/repository/todo_repository.dart';

class GetTodoList implements UseCase<Stream<List<Todo>>, void> {
  final TodoRepository todoRepository;

  GetTodoList(this.todoRepository);

  @override
  Stream<List<Todo>> call(void noParameter) {
    return todoRepository.getTodoList();
  }
}
