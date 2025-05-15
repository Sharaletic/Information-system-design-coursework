import 'package:equatable/equatable.dart';

class Person extends Equatable {
  const Person({
    this.id,
    required this.fullName,
    required this.post,
    this.academicDegree,
    this.workExperience,
    this.departmentId,
    this.role,
    this.login,
    this.password,
  });
  final String? id;
  final String fullName;
  final String? post;
  final String? academicDegree;
  final String? workExperience;
  final String? departmentId;
  final RolePerson? role;
  final String? login;
  final String? password;

  @override
  List<Object?> get props => [
        id,
        fullName,
        post,
        academicDegree,
        workExperience,
        departmentId,
        role,
        login,
        password,
      ];
}

enum RolePerson {
  teacher('Преподаватель'),
  headOfDepartment('Заведующий кафедрой');

  const RolePerson(this.value);
  final String value;
}
