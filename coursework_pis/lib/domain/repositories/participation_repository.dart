import 'package:fpdart/fpdart.dart';

import '../../core/error/failure.dart';
import '../models/person.dart';

abstract interface class ParticipationRepository {
  Future<Either<Failure, Unit>> updateParticipation(
      {required Person person, required String academicLoadId});

  Future<Either<Failure, Unit>> addParticipation(
      {required Person person, required String academicLoadId});
}
