import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/presentation/bloc/todo_bloc.dart';
import 'package:todo/features/presentation/pages/home.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await startUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => sl<TodoBloc>())],
      child: const MaterialApp(
        title: 'To-Do App',
        home: HomeView(),
      ),
    );
  }
}
