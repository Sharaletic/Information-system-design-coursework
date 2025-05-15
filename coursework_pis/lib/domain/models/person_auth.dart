import 'package:coursework_pis/domain/models/person.dart';

class PersonAuth {
  PersonAuth({
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
}
