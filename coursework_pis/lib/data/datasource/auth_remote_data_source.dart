import 'package:coursework_pis/core/error/server_exception.dart';
import 'package:coursework_pis/data/models/person_auth/person_auth_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<PersonAuthDto> login(
      {required String login, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;

  @override
  Future<PersonAuthDto> login(
      {required String login, required String password}) async {
    try {
      final response = await supabaseClient.auth
          .signInWithPassword(email: login, password: password);
      if (response.user == null) {
        throw ServerException('Пользователь не найден');
      }

      final json = response.session!.user.toJson();
      return PersonAuthDto.fromJson(json);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
