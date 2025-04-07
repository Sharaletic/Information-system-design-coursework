// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDto _$PersonDtoFromJson(Map<String, dynamic> json) => PersonDto(
      id: json['id'] as String?,
      fullName: json['full_name'] as String,
      post: json['post'] as String,
      academicDegree: json['academic_degree'] as String,
      workExperience: json['work_experience'] as String,
      idDepartment: json['id_department'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$PersonDtoToJson(PersonDto instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'post': instance.post,
      'academic_degree': instance.academicDegree,
      'work_experience': instance.workExperience,
      'id_department': instance.idDepartment,
      'status': instance.status,
    };
