import 'package:coursework_pis/domain/models/department.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'department_dto.g.dart';

@JsonSerializable()
class DepartmentDto {
  DepartmentDto({
    required this.id,
    required this.title,
  });
  final String id;
  final String title;

  Department toDomain() => Department(
        id: id,
        title: title,
      );

  factory DepartmentDto.fromDomain(Department object) => DepartmentDto(
        id: object.id,
        title: object.title,
      );

  Map<String, dynamic> toJson() => _$DepartmentDtoToJson(this);

  factory DepartmentDto.fromJson(Map<String, dynamic> json) =>
      _$DepartmentDtoFromJson(json);
}
