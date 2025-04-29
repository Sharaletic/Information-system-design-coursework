class AcademicLoad {
  AcademicLoad({
    required this.id,
    required this.personId,
    required this.disciplineId,
    required this.lessonType,
    required this.quantityHours,
    required this.group,
    required this.appointmentYear,
    required this.semester,
    required this.departmentId,
  });
  final String id;
  final String? personId;
  final String disciplineId;
  final String lessonType;
  final int quantityHours;
  final String group;
  final DateTime appointmentYear;
  final String semester;
  final String departmentId;
}
