import 'package:coursework_pis/core/error/failure.dart';
import 'package:coursework_pis/core/utils/table_names.dart';
import 'package:coursework_pis/data/models/person/person_dto.dart';
import 'package:coursework_pis/data/services/user_service.dart';
import 'package:coursework_pis/domain/models/person.dart';
import 'package:coursework_pis/domain/repositories/person_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/unit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PersonRepositoryImpl implements PersonRepository {
  PersonRepositoryImpl({
    required this.supabaseClient,
    required this.userService,
    required this.sharedPreferences,
  });
  final SupabaseClient supabaseClient;
  final UserService userService;
  final SharedPreferences sharedPreferences;

  @override
  String get currentUserId => supabaseClient.auth.currentUser!.id;

  @override
  Future<Either<Failure, List<Person>>> getPerson() async {
    try {
      final departmentIdResult = await userService.getCurrentUserDepartment();

      return departmentIdResult
          .fold((failure) => left(Failure(message: failure.message)),
              (departmentId) async {
        final json = await supabaseClient
            .from(TableNames.personTable)
            .select()
            .eq('department_id', departmentId);
        List<Person> person = json
            .map((element) => PersonDto.fromJson(element).toDomain())
            .toList();
        return right(person);
      });
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addPerson({required Person person}) async {
    try {
      final result = await userService.getCurrentUserDepartment();

      return await result
          .fold((failure) => left(Failure(message: failure.message)),
              (departmentId) async {
        final dto = PersonDto.fromDomain(person);
        dto.departmentId = departmentId;
        final json = dto.toJson();
        json.remove('id');
        await supabaseClient.from(TableNames.personTable).insert(json);
        return right(unit);
      });
    } catch (e) {
      if (e is PostgrestException && e.code == '23505') {
        return left(
            Failure(message: 'Пользователь с таким логином существует'));
      }
      return left(Failure(message: e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, Unit>> addUser({required Person person}) async {
  //   try {
  //     // final response =
  //     //     await supabaseClient.auth.admin.createUser(AdminUserAttributes(
  //     //   email: person.password!,
  //     //   password: '${person.login}${AppStrings.email}',
  //     //   userMetadata: {'name': person.fullName},
  //     // ));
  //
  //     final response = await supabaseClient.auth.signUp(
  //       password: person.password!,
  //       email: '${person.login}${AppStrings.email}',
  //     );
  //     final newUserId = response.user!.id;
  //     addPerson(person: person, userId: newUserId);
  //     return right(unit);
  //   } catch (e) {
  //     return left(Failure(message: e.toString()));
  //   }
  // }

  @override
  Future<Either<Failure, Unit>> deletePerson({required String id}) async {
    try {
      await supabaseClient
          .from(TableNames.participationTable)
          .delete()
          .eq('person_id', id);
      await supabaseClient.from(TableNames.personTable).delete().eq('id', id);
      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePerson({required Person person}) async {
    try {
      final result = await userService.getCurrentUserDepartment();

      return result.fold((failure) => left(Failure(message: failure.message)),
          (departmentId) async {
        final dto = PersonDto.fromDomain(person);
        dto.departmentId = departmentId;
        final json = dto.toJson();
        await supabaseClient
            .from(TableNames.personTable)
            .update(json)
            .eq('id', dto.id!);
        return right(unit);
      });
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
