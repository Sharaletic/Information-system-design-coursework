import 'package:coursework_pis/core/error/failure.dart';
import 'package:coursework_pis/core/error/server_exception.dart';
import 'package:coursework_pis/data/datasource/auth_remote_data_source.dart';
import 'package:coursework_pis/domain/models/person_auth.dart';
import 'package:coursework_pis/domain/repositories/auth_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
      {required this.remoteDataSource, required this.supabaseClient});
  final AuthRemoteDataSource remoteDataSource;
  final SupabaseClient supabaseClient;

  @override
  Future<Either<Failure, PersonAuth>> login(
      {required String login, required String password}) async {
    try {
      final person =
          await remoteDataSource.login(login: login, password: password);
      return right(person.toDomain());
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    }
  }
}
