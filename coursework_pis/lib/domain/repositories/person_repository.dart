import 'package:coursework_pis/core/error/failure.dart';
import 'package:coursework_pis/data/models/person/person_dto.dart';
import 'package:coursework_pis/domain/models/person.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class PersonRepository {
  Future<Either<Failure, List<Person>>> getPerson(
      {required String idDepartment});

  Future<Either<Failure, Unit>> addPerson({required PersonDto dto});

  Future<Either<Failure, Unit>> deletePerson({required String id});

  Future<Either<Failure, Unit>> updatePerson({required PersonDto dto});
}
