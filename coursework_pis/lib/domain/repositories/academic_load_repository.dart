import 'package:coursework_pis/core/error/failure.dart';
import 'package:coursework_pis/domain/models/full_academic_load.dart';
import 'package:fpdart/fpdart.dart';

import '../models/academic_load.dart';
import '../models/person.dart';

abstract interface class AcademicLoadRepository {
  Future<Either<Failure, List<FullAcademicLoad>>> getAcademicLoad();

  Future<Either<Failure, Unit>> addAcademicLoad(
      {required AcademicLoad academicLoad});

  Future<Either<Failure, Unit>> deleteAcademicLoad({required String id});

  Future<Either<Failure, Unit>> updateAcademicLoad(
      {required AcademicLoad academicLoad});
}
