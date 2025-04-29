// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'academic_load_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcademicLoadDto _$AcademicLoadDtoFromJson(Map<String, dynamic> json) =>
    AcademicLoadDto(
      id: json['id'] as String,
      personId: json['personId'] as String?,
      disciplineId: json['disciplineId'] as String,
      lessonType: json['lesson_type'] as String,
      quantityHours: (json['quantity_hours'] as num).toInt(),
      group: json['group'] as String,
      appointmentYear: DateTime.parse(json['appointment_year'] as String),
      semester: json['semester'] as String,
      departmentId: json['department_id'] as String,
    );

Map<String, dynamic> _$AcademicLoadDtoToJson(AcademicLoadDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'personId': instance.personId,
      'disciplineId': instance.disciplineId,
      'lesson_type': instance.lessonType,
      'quantity_hours': instance.quantityHours,
      'group': instance.group,
      'appointment_year': instance.appointmentYear.toIso8601String(),
      'semester': instance.semester,
      'department_id': instance.departmentId,
    };
