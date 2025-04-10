import 'package:coursework_pis/domain/models/person_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'person_auth_dto.g.dart';

@JsonSerializable()
class PersonAuthDto {
  PersonAuthDto({required this.id, required this.login});
  final String id;
  final String login;

  PersonAuth toDomain() => PersonAuth(id: id, login: login);

  factory PersonAuthDto.fromDomain(PersonAuth object) =>
      PersonAuthDto(id: object.id, login: object.login);

  factory PersonAuthDto.fromJson(Map<String, dynamic> json) =>
      _$PersonAuthDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonAuthDtoToJson(this);
}
