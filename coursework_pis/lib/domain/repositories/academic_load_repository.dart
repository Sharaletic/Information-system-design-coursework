import 'package:coursework_pis/core/error/failure.dart';
import 'package:coursework_pis/domain/models/academic_load.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AcademicLoadRepository {
  Future<Either<Failure, AcademicLoad>> getAcademicLoad();
}
