import 'package:coursework_pis/core/error/server_exception.dart';
import 'package:coursework_pis/domain/models/person_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/utils/table_names.dart';
import '../models/person_auth/person_auth_dto.dart';

abstract interface class AuthRemoteDataSource {
  Future<PersonAuth> login({required String login, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({
    required this.supabaseClient,
    required this.sharedPreferences,
  });
  final SupabaseClient supabaseClient;
  final SharedPreferences sharedPreferences;

  @override
  Future<PersonAuth> login(
      {required String login, required String password}) async {
    try {
      final json = await supabaseClient
          .from(TableNames.personTable)
          .select()
          .match({'login': login, 'password': password}).single();

      sharedPreferences.setString('id', json['id']);
      sharedPreferences.setString('role', json['role']);
      sharedPreferences.setString('department', json['department_id']);

      return PersonAuthDto.fromJson(json).toDomain();
    } catch (e) {
      if (e is PostgrestException && e.code == 'PGRST116') {
        throw ServerException('Пользователь не найден');
      }
      throw ServerException('Проблемы с сетью');
    }
  }
}
