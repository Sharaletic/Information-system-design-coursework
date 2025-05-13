import 'package:coursework_pis/domain/models/discipline.dart';
import 'package:coursework_pis/domain/models/person.dart';

class FullAcademicLoad {
  FullAcademicLoad({
    required this.id,
    required this.person,
    required this.discipline,
    required this.lessonType,
    required this.quantityHours,
    required this.group,
    required this.appointmentYear,
    this.departmentId,
  });
  final String id;
  final Person? person;
  final Discipline discipline;
  final String lessonType;
  final int quantityHours;
  final String group;
  final DateTime appointmentYear;
  final String? departmentId;
}
