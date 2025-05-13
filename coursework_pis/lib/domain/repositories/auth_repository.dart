import 'package:coursework_pis/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, Unit>> login(
      {required String login, required String password});
}
