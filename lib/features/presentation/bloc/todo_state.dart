part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<Todo> todos;

  const TodoLoadedState(this.todos);

  @override
  List<Object> get props => [todos];
}

class TodoOperationSuccessState extends TodoState {
  final String message;

  const TodoOperationSuccessState(this.message);

  @override
  List<Object> get props => [message];
}

class TodoErrorState extends TodoState {
  final String errorMessage;

  const TodoErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}