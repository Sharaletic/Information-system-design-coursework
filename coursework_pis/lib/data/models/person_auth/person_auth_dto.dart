import 'package:coursework_pis/domain/models/person.dart';
import 'package:coursework_pis/domain/models/person_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'person_auth_dto.g.dart';

@JsonSerializable()
class PersonAuthDto {
  PersonAuthDto({
    this.id,
    required this.fullName,
    required this.post,
    this.academicDegree,
    this.workExperience,
    this.departmentId,
    this.role,
    this.login,
    this.password,
  });
  String? id;
  @JsonKey(name: 'full_name')
  final String fullName;
  final String? post;
  @JsonKey(name: 'academic_degree')
  final String? academicDegree;
  @JsonKey(name: 'work_experience')
  final String? workExperience;
  @JsonKey(name: 'department_id')
  String? departmentId;
  String? role;
  final String? login;
  final String? password;

  RolePerson? getStatus(String? status) {
    return status != null
        ? RolePerson.values.firstWhere(
            (item) => item.value == status,
          )
        : null;
  }

  PersonAuth toDomain() => PersonAuth(
        id: id,
        fullName: fullName,
        post: post,
        academicDegree: academicDegree,
        workExperience: workExperience,
        departmentId: departmentId,
        role: getStatus(role),
        login: login,
        password: password,
      );

  factory PersonAuthDto.fromDomain(Person object) => PersonAuthDto(
        id: object.id,
        fullName: object.fullName,
        post: object.post,
        academicDegree: object.academicDegree,
        workExperience: object.workExperience,
        departmentId: object.departmentId,
        role: object.role?.value,
        login: object.login,
        password: object.password,
      );

  Map<String, dynamic> toJson() => _$PersonAuthDtoToJson(this);

  factory PersonAuthDto.fromJson(Map<String, dynamic> json) =>
      _$PersonAuthDtoFromJson(json);
}
