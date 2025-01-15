import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/student_provider.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final students = Provider.of<StudentProvider>(context).students;
    print(students.length);
    return Scaffold(
      appBar: AppBar(title: const Text('Students')),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            title: Text('${student.firstName} ${student.lastName}'),
            subtitle: Text('Grade: ${student.grade}'),
          );
        },
      ),
    );
  }
}
