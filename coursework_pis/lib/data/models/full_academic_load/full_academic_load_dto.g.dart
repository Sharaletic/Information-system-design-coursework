// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_academic_load_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullAcademicLoadDto _$FullAcademicLoadDtoFromJson(Map<String, dynamic> json) =>
    FullAcademicLoadDto(
      id: json['id'] as String,
      person: json['person'] == null
          ? null
          : PersonDto.fromJson(json['person'] as Map<String, dynamic>),
      discipline:
          DisciplineDto.fromJson(json['discipline'] as Map<String, dynamic>),
      lessonType: json['lesson_type'] as String,
      quantityHours: (json['quantity_hours'] as num).toInt(),
      group: json['group'] as String,
      appointmentYear: (json['appointment_year'] as num).toInt(),
      semester: (json['semester'] as num).toInt(),
      departmentId: json['department_id'] as String?,
    );

Map<String, dynamic> _$FullAcademicLoadDtoToJson(
        FullAcademicLoadDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'person': instance.person,
      'discipline': instance.discipline,
      'lesson_type': instance.lessonType,
      'quantity_hours': instance.quantityHours,
      'group': instance.group,
      'appointment_year': instance.appointmentYear,
      'semester': instance.semester,
      'department_id': instance.departmentId,
    };
