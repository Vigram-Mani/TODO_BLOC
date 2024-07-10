import 'package:get_it/get_it.dart';
import 'package:todo/features/data/repository/todo_firebase_adapter.dart';
import 'package:todo/features/domain/repository/todo_repository.dart';
import 'package:todo/features/domain/use-cases/add_todo.dart';
import 'package:todo/features/domain/use-cases/delete_todo.dart';
import 'package:todo/features/domain/use-cases/get_todo.dart';
import 'package:todo/features/domain/use-cases/update_todo.dart';
import 'package:todo/features/presentation/bloc/todo_bloc.dart';

Future<void> todoManagementInjection(GetIt sl) async {
  sl.registerLazySingleton<TodoRepository>(() => TodoFirebaseRepository());
  sl.registerLazySingleton<AddTodo>(() => AddTodo(sl()));
  sl.registerLazySingleton<GetTodoList>(() => GetTodoList(sl()));
  sl.registerLazySingleton<UpdateTodo>(() => UpdateTodo(sl()));
  sl.registerLazySingleton<DeleteTodo>(() => DeleteTodo(sl()));

  sl.registerFactory<TodoBloc>(() => TodoBloc(
      addTodo: sl<AddTodo>(),
      getTodoList: sl<GetTodoList>(),
      updateTodo: sl<UpdateTodo>(),
      deleteTodo: sl<DeleteTodo>()));
}
