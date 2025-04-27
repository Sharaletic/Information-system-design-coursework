import 'package:coursework_pis/domain/models/discipline.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'discipline_dto.g.dart';

@JsonSerializable()
class DisciplineDto {
  DisciplineDto({
    required this.id,
    required this.disciplineTitle,
  });
  final String id;
  final String disciplineTitle;

  Discipline toDomain() => Discipline(
        id: id,
        disciplineTitle: disciplineTitle,
      );

  factory DisciplineDto.fromDomain(Discipline object) => DisciplineDto(
        id: object.id,
        disciplineTitle: object.disciplineTitle,
      );

  Map<String, dynamic> toJson() => _$DisciplineDtoToJson(this);

  factory DisciplineDto.fromJson(Map<String, dynamic> json) =>
      _$DisciplineDtoFromJson(json);
}
