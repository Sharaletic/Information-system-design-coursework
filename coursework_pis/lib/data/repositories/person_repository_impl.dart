import 'package:coursework_pis/core/error/failure.dart';
import 'package:coursework_pis/core/utils/table_names.dart';
import 'package:coursework_pis/data/models/person/person_dto.dart';
import 'package:coursework_pis/domain/models/person.dart';
import 'package:coursework_pis/domain/repositories/person_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/unit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PersonRepositoryImpl implements PersonRepository {
  PersonRepositoryImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  @override
  Future<Either<Failure, List<Person>>> getPerson(
      {required String idDepartment}) async {
    try {
      final json = await supabaseClient
          .from(TableNames.personTable)
          .select('')
          .eq('id_department', idDepartment);
      List<Person> person = json
          .map((element) => PersonDto.fromJson(element).toDomain())
          .toList();
      return right(person);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addPerson({required PersonDto dto}) async {
    try {
      final json = dto.toJson();
      await supabaseClient.from(TableNames.personTable).insert(json);
      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePerson({required String id}) async {
    try {
      await supabaseClient.from(TableNames.personTable).delete().eq('id', id);
      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePerson({required PersonDto dto}) async {
    try {
      final json = dto.toJson();
      await supabaseClient
          .from(TableNames.personTable)
          .update(json)
          .eq('id', dto.id);
      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
