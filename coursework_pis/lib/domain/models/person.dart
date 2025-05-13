class Person {
  Person({
    this.id,
    required this.fullName,
    required this.post,
    this.academicDegree,
    this.workExperience,
    this.departmentId,
    this.status,
    this.login,
    this.password,
  });
  final String? id;
  final String fullName;
  final String? post;
  final String? academicDegree;
  final String? workExperience;
  final String? departmentId;
  final StatusPerson? status;
  final String? login;
  final String? password;
}

enum StatusPerson {
  teacher('Преподаватель'),
  headOfDepartment('Заведующий кафедрой');

  const StatusPerson(this.value);
  final String value;
}
