import 'package:coursework_pis/core/error/failure.dart';
import 'package:coursework_pis/domain/models/discipline.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class DisciplineRepository {
  Future<Either<Failure, List<Discipline>>> getDisciplines();
}
