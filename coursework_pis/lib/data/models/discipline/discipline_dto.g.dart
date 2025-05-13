// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discipline_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisciplineDto _$DisciplineDtoFromJson(Map<String, dynamic> json) =>
    DisciplineDto(
      id: json['id'] as String?,
      disciplineTitle: json['discipline_title'] as String?,
      departmentId: json['department_id'] as String?,
    );

Map<String, dynamic> _$DisciplineDtoToJson(DisciplineDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'discipline_title': instance.disciplineTitle,
      'department_id': instance.departmentId,
    };
