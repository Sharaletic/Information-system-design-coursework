import 'package:coursework_pis/domain/models/academic_load.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'academic_load_dto.g.dart';

@JsonSerializable()
class AcademicLoadDto {
  AcademicLoadDto({
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
  @JsonKey(name: 'lesson_type')
  final String lessonType;
  @JsonKey(name: 'quantity_hours')
  final int quantityHours;
  final String group;
  @JsonKey(name: 'appointment_year')
  final DateTime appointmentYear;
  final String semester;
  @JsonKey(name: 'department_id')
  final String departmentId;

  AcademicLoad toDomain() => AcademicLoad(
        id: id,
        personId: personId,
        disciplineId: disciplineId,
        lessonType: lessonType,
        quantityHours: quantityHours,
        group: group,
        appointmentYear: appointmentYear,
        semester: semester,
        departmentId: departmentId,
      );

  factory AcademicLoadDto.fromDomain(AcademicLoad object) => AcademicLoadDto(
        id: object.id,
        personId: object.personId,
        disciplineId: object.disciplineId,
        lessonType: object.lessonType,
        quantityHours: object.quantityHours,
        group: object.group,
        appointmentYear: object.appointmentYear,
        semester: object.semester,
        departmentId: object.departmentId,
      );

  Map<String, dynamic> toJson() => _$AcademicLoadDtoToJson(this);

  factory AcademicLoadDto.fromJson(Map<String, dynamic> json) =>
      _$AcademicLoadDtoFromJson(json);
}
