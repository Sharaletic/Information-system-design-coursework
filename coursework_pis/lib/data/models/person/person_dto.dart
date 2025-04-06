import 'package:coursework_pis/domain/models/person.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'person_dto.g.dart';

@JsonSerializable()
class PersonDto {
  PersonDto(
      {required this.id,
      required this.name,
      required this.post,
      required this.academicDegree,
      required this.workExperience,
      required this.idDepartment,
      required this.status});
  final String id;
  final String name;
  final String post;
  @JsonKey(name: 'academic_degree')
  final String academicDegree;
  @JsonKey(name: 'work_experience')
  final String workExperience;
  final String idDepartment;
  final String status;

  Person toDomain() => Person(
        id: id,
        name: name,
        post: post,
        academicDegree: academicDegree,
        workExperience: workExperience,
        idDepartment: idDepartment,
        status: status,
      );

  factory PersonDto.fromDomain(Person object) => PersonDto(
        id: object.id,
        name: object.name,
        post: object.post,
        academicDegree: object.academicDegree,
        workExperience: object.workExperience,
        idDepartment: object.idDepartment,
        status: object.status,
      );

  Map<String, dynamic> toJson() => _$PersonDtoToJson(this);

  factory PersonDto.fromJson(Map<String, dynamic> json) =>
      _$PersonDtoFromJson(json);
}
