// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'academic_load_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcademicLoadDto _$AcademicLoadDtoFromJson(Map<String, dynamic> json) =>
    AcademicLoadDto(
      id: json['id'] as String,
      disciplineId: json['discipline_id'] as String,
      lessonType: json['lesson_type'] as String,
      quantityHours: (json['quantity_hours'] as num).toInt(),
      group: json['group'] as String,
      appointmentYear: DateTime.parse(json['appointment_year'] as String),
      departmentId: json['department_id'] as String?,
    );

Map<String, dynamic> _$AcademicLoadDtoToJson(AcademicLoadDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'discipline_id': instance.disciplineId,
      'lesson_type': instance.lessonType,
      'quantity_hours': instance.quantityHours,
      'group': instance.group,
      'appointment_year': instance.appointmentYear.toIso8601String(),
      'department_id': instance.departmentId,
    };
