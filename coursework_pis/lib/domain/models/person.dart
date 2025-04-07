class Person {
  Person(
      {this.id,
      required this.fullName,
      required this.post,
      required this.academicDegree,
      required this.workExperience,
      this.idDepartment,
      this.status});
  final String? id;
  final String fullName;
  final String post;
  final String academicDegree;
  final String workExperience;
  final String? idDepartment;
  final String? status;
}
