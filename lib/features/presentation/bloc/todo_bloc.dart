import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo/core/no_parameters.dart';
import 'package:todo/core/use_cases.dart';
import 'package:todo/features/domain/entities/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final UseCase addTodo;
  final UseCase getTodoList;
  final UseCase updateTodo;
  final UseCase deleteTodo;

  TodoBloc(
      {required this.addTodo,
      required this.getTodoList,
      required this.updateTodo,
      required this.deleteTodo})
      : super(TodoInitialState()) {
    on<LoadTodosEvent>(loadTodosItems);

    on<AddTodoEvent>(addTodoItem);

    on<UpdateTodoEvent>(updateTodoItem);

    on<DeleteTodoEvent>(deleteTodoItem);
  }

  Future<void> loadTodosItems(
      LoadTodosEvent loadTodosEvent, Emitter<TodoState> emit) async {
    try {
      emit(TodoLoadingState());
      final todos = await getTodoList(NoParameters).first;
      emit(TodoLoadedState(todos));
    } catch (e) {
      emit(const TodoErrorState('Failed to load todos.'));
    }
  }

  Future<void> addTodoItem(
      AddTodoEvent addTodoEvent, Emitter<TodoState> emit) async {
    try {
      emit(TodoLoadingState());
      await addTodo(addTodoEvent.todo);
      emit(const TodoOperationSuccessState('Todo added successfully.'));
    } catch (e) {
      emit(const TodoErrorState('Failed to add todo.'));
    }
  }

  Future<void> updateTodoItem(
      UpdateTodoEvent updateTodoEvent, Emitter<TodoState> emit) async {
    try {
      emit(TodoLoadingState());
      await updateTodo(updateTodoEvent.todo);
      emit(const TodoOperationSuccessState('Todo updated successfully.'));
    } catch (e) {
      emit(const TodoErrorState('Failed to update todo.'));
    }
  }

  Future<void> deleteTodoItem(
      DeleteTodoEvent deleteTodoEvent, Emitter<TodoState> emit) async {
    try {
      emit(TodoLoadingState());
      await deleteTodo(deleteTodoEvent.todoId);
      emit(const TodoOperationSuccessState('Todo deleted successfully.'));
    } catch (e) {
      emit(const TodoErrorState('Failed to delete todo.'));
    }
  }
}
