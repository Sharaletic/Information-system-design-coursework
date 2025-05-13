import 'package:coursework_pis/domain/models/discipline.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'discipline_dto.g.dart';

@JsonSerializable()
class DisciplineDto {
  DisciplineDto({
    this.id,
    this.disciplineTitle,
    this.departmentId,
  });
  final String? id;
  @JsonKey(name: 'discipline_title')
  final String? disciplineTitle;
  @JsonKey(name: 'department_id')
  final String? departmentId;

  Discipline toDomain() => Discipline(
        id: id,
        disciplineTitle: disciplineTitle,
        departmentId: departmentId,
      );

  factory DisciplineDto.fromDomain(Discipline object) => DisciplineDto(
        id: object.id,
        disciplineTitle: object.disciplineTitle,
        departmentId: object.departmentId,
      );

  Map<String, dynamic> toJson() => _$DisciplineDtoToJson(this);

  factory DisciplineDto.fromJson(Map<String, dynamic> json) =>
      _$DisciplineDtoFromJson(json);
}
