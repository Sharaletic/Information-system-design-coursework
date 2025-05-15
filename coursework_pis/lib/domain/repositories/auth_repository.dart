import 'package:coursework_pis/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../models/person_auth.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, PersonAuth>> login(
      {required String login, required String password});
}
