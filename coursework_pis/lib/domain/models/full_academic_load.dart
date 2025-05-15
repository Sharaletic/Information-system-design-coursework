import 'package:coursework_pis/domain/models/discipline.dart';
import 'package:coursework_pis/domain/models/person.dart';
import 'package:equatable/equatable.dart';

class FullAcademicLoad extends Equatable {
  const FullAcademicLoad({
    required this.id,
    required this.person,
    required this.discipline,
    required this.lessonType,
    required this.quantityHours,
    required this.group,
    required this.appointmentYear,
    required this.semester,
    this.departmentId,
  });
  final String id;
  final Person? person;
  final Discipline discipline;
  final String lessonType;
  final int quantityHours;
  final String group;
  final int appointmentYear;
  final int semester;
  final String? departmentId;

  @override
  List<Object?> get props => [
        id,
        person,
        discipline,
        lessonType,
        quantityHours,
        group,
        appointmentYear,
        semester,
        departmentId,
      ];
}
