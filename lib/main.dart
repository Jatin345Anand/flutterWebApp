import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/student_provider.dart';
import './screens/login_screen.dart';
import './screens/students_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StudentProvider(),
      child: MaterialApp(
        title: 'Student CRUD',
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginScreen(),
          '/students': (context) => StudentsScreen(),
        },
      ),
    );
  }
}
