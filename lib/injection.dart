import 'package:get_it/get_it.dart';
import 'package:todo/features/coupling/todo_injection.dart';

final sl = GetIt.instance;

Future<void> startUp() async {
  await todoManagementInjection(sl);
}