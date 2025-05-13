import 'package:coursework_pis/data/models/discipline/discipline_dto.dart';
import 'package:coursework_pis/data/models/person/person_dto.dart';
import 'package:coursework_pis/domain/models/full_academic_load.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'full_academic_load_dto.g.dart';

@JsonSerializable()
class FullAcademicLoadDto {
  FullAcademicLoadDto({
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
  final PersonDto? person;
  final DisciplineDto discipline; // DisciplineDto
  @JsonKey(name: 'lesson_type')
  final String lessonType;
  @JsonKey(name: 'quantity_hours')
  final int quantityHours;
  final String group;
  @JsonKey(name: 'appointment_year')
  final DateTime appointmentYear;
  @JsonKey(name: 'department_id')
  String? departmentId;

  FullAcademicLoad toDomain() => FullAcademicLoad(
        id: id,
        person: person?.toDomain(),
        discipline: discipline.toDomain(),
        lessonType: lessonType,
        quantityHours: quantityHours,
        group: group,
        appointmentYear: appointmentYear,
        departmentId: departmentId,
      );

  factory FullAcademicLoadDto.fromDomain(FullAcademicLoad object) => FullAcademicLoadDto(
        id: object.id,
        person:
            object.person == null ? null : PersonDto.fromDomain(object.person!),
        discipline: DisciplineDto.fromDomain(object.discipline),
        lessonType: object.lessonType,
        quantityHours: object.quantityHours,
        group: object.group,
        appointmentYear: object.appointmentYear,
        departmentId: object.departmentId,
      );

  Map<String, dynamic> toJson() => _$FullAcademicLoadDtoToJson(this);

  factory FullAcademicLoadDto.fromJson(Map<String, dynamic> json) =>
      _$FullAcademicLoadDtoFromJson(json);
}
