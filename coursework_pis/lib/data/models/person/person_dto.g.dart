// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDto _$PersonDtoFromJson(Map<String, dynamic> json) => PersonDto(
      id: json['id'] as String,
      name: json['name'] as String,
      post: json['post'] as String,
      academicDegree: json['academic_degree'] as String,
      workExperience: json['work_experience'] as String,
      idDepartment: json['idDepartment'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$PersonDtoToJson(PersonDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'post': instance.post,
      'academic_degree': instance.academicDegree,
      'work_experience': instance.workExperience,
      'idDepartment': instance.idDepartment,
      'status': instance.status,
    };
