class Student {
  final int id;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final int grade;
  final String phone;
  final String email;

  Student({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.grade,
    required this.phone,
    required this.email,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      dateOfBirth: json['date_of_birth'],
      grade: json['grade'],
      phone: json['phone'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'date_of_birth': dateOfBirth,
      'grade': grade,
      'phone': phone,
      'email': email,
    };
  }
}
