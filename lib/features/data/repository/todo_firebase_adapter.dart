import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/features/domain/entities/todo.dart';
import 'package:todo/features/domain/repository/todo_repository.dart';

class TodoFirebaseRepository implements TodoRepository {
  final CollectionReference todosCollection =
      FirebaseFirestore.instance.collection('todos');
  @override
  Future<void> addTodo(Todo todo) async {
    await todosCollection.add({
      'title': todo.title,
      'completed': todo.completed,
    });
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    await todosCollection.doc(todoId).delete();
  }

  @override
  Stream<List<Todo>> getTodoList() {
    return todosCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Todo(
          id: doc.id,
          title: data['title'],
          completed: data['completed'],
        );
      }).toList();
    });
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    todosCollection.doc(todo.id).update({
      'title': todo.title,
      'completed': todo.completed,
    });
  }
}
