import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/academic_load.dart';
part 'academic_load_dto.g.dart';

@JsonSerializable()
class AcademicLoadDto {
  AcademicLoadDto({
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
  @JsonKey(name: 'discipline_id')
  final String disciplineId;
  @JsonKey(name: 'lesson_type')
  final String lessonType;
  @JsonKey(name: 'quantity_hours')
  final int quantityHours;
  final String group;
  @JsonKey(name: 'appointment_year')
  final int appointmentYear;
  final int semester;
  @JsonKey(name: 'department_id')
  String? departmentId;

  AcademicLoad toDomain() => AcademicLoad(
        id: id,
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
