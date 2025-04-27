import 'package:coursework_pis/core/error/failure.dart';
import 'package:coursework_pis/data/models/person/person_dto.dart';
import 'package:coursework_pis/domain/models/person.dart';
import 'package:coursework_pis/domain/models/person_auth.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class PersonRepository {
  String get currentUserId;

  Future<Either<Failure, List<Person>>> getPerson();

  Future<Either<Failure, Unit>> addPerson(
      {required Person person});

  Future<Either<Failure, Unit>> deletePerson({required String id});

  Future<Either<Failure, Unit>> updatePerson({required Person person});
}
