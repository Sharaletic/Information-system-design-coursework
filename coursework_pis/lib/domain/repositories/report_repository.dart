import 'package:fpdart/fpdart.dart';
import '../../core/error/failure.dart';
import '../models/full_academic_load.dart';

abstract interface class ReportRepository {
  Future<Either<Failure, List<FullAcademicLoad>>> getFilterAcademicLoad({
    required String? semester,
    required String? appointmentDate,
    required String? namePerson,
  });
}
