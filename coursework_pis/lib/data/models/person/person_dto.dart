import 'package:coursework_pis/domain/models/person.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'person_dto.g.dart';

@JsonSerializable()
class PersonDto {
  PersonDto(
      {this.id,
      required this.fullName,
      required this.post,
      required this.academicDegree,
      required this.workExperience,
      this.departmentId,
      required this.status});
  String? id;
  @JsonKey(name: 'full_name')
  final String fullName;
  final String post;
  @JsonKey(name: 'academic_degree')
  final String academicDegree;
  @JsonKey(name: 'work_experience')
  final String workExperience;
  @JsonKey(name: 'department_id')
  String? departmentId;
  String? status;

  StatusPerson getStatus(String? status) {
    return StatusPerson.values.firstWhere(
      (item) => item.value == status,
    );
  }

  Person toDomain() => Person(
        id: id,
        fullName: fullName,
        post: post,
        academicDegree: academicDegree,
        workExperience: workExperience,
        departmentId: departmentId,
        status: getStatus(status),
      );

  factory PersonDto.fromDomain(Person object) => PersonDto(
        id: object.id,
        fullName: object.fullName,
        post: object.post,
        academicDegree: object.academicDegree,
        workExperience: object.workExperience,
        departmentId: object.departmentId,
        status: object.status.value,
      );

  Map<String, dynamic> toJson() => _$PersonDtoToJson(this);

  factory PersonDto.fromJson(Map<String, dynamic> json) =>
      _$PersonDtoFromJson(json);
}
