import 'package:coursework_pis/core/error/failure.dart';
import 'package:coursework_pis/domain/models/person_auth.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, PersonAuth>> login(
      {required String login, required String password});
}
