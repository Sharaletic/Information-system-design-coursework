import 'package:coursework_pis/domain/models/discipline.dart';
import 'package:coursework_pis/domain/models/person.dart';

class AcademicLoad {
  AcademicLoad({
    required this.id,
    required this.disciplineId,
    required this.lessonType,
    required this.quantityHours,
    required this.group,
    required this.appointmentYear,
    this.departmentId,
  });
  final String id;
  final String disciplineId;
  final String lessonType;
  final int quantityHours;
  final String group;
  final DateTime appointmentYear;
  final String? departmentId;
}
