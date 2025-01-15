import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/student_model.dart';

class StudentProvider with ChangeNotifier {
  List<Student> _students = [];
  String _token = '';

  List<Student> get students => _students;

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/login/'),
      body: json.encode({'username': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    print(response);
    if (response.statusCode == 200) {
      _token = json.decode(response.body)['token'];
      notifyListeners();
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<void> fetchStudents() async {
    final response = await http.get(
      Uri.parse('http://localhost:8000/api/students'),
      headers: {'Authorization': 'Bearer $_token'},
    );
    print(response.toString());

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      _students = data.map((json) => Student.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to fetch students');
    }
  }
}
