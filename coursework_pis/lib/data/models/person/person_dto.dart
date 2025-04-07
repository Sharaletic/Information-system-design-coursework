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
      this.idDepartment,
      this.status});
  final String? id;
  @JsonKey(name: 'full_name')
  final String fullName;
  final String post;
  @JsonKey(name: 'academic_degree')
  final String academicDegree;
  @JsonKey(name: 'work_experience')
  final String workExperience;
  @JsonKey(name: 'id_department')
  final String? idDepartment;
  final String? status;

  Person toDomain() => Person(
        id: id,
        fullName: fullName,
        post: post,
        academicDegree: academicDegree,
        workExperience: workExperience,
        idDepartment: idDepartment,
        status: status,
      );

  factory PersonDto.fromDomain(Person object) => PersonDto(
        id: object.id,
        fullName: object.fullName,
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
