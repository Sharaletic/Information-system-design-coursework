import 'package:coursework_pis/domain/models/discipline.dart';
import 'package:coursework_pis/domain/models/person.dart';

class AcademicLoad {
  AcademicLoad({
    this.id,
    required this.disciplineId,
    required this.lessonType,
    required this.quantityHours,
    required this.group,
    required this.appointmentYear,
    required this.semester,
    this.departmentId,
  });
  final String? id;
  final String disciplineId;
  final String lessonType;
  final int quantityHours;
  final String group;
  final int appointmentYear;
  final int semester;
  final String? departmentId;
}
