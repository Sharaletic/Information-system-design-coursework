// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_auth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonAuthDto _$PersonAuthDtoFromJson(Map<String, dynamic> json) =>
    PersonAuthDto(
      id: json['id'] as String?,
      fullName: json['full_name'] as String,
      post: json['post'] as String?,
      academicDegree: json['academic_degree'] as String?,
      workExperience: json['work_experience'] as String?,
      departmentId: json['department_id'] as String?,
      role: json['role'] as String?,
      login: json['login'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$PersonAuthDtoToJson(PersonAuthDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'post': instance.post,
      'academic_degree': instance.academicDegree,
      'work_experience': instance.workExperience,
      'department_id': instance.departmentId,
      'role': instance.role,
      'login': instance.login,
      'password': instance.password,
    };
