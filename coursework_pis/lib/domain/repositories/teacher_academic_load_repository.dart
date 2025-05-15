import 'package:fpdart/fpdart.dart';
import '../../core/error/failure.dart';
import '../models/full_academic_load.dart';

abstract interface class TeacherAcademicLoadRepository {
  Future<Either<Failure, List<FullAcademicLoad>>> getAcademicLoadForTeacher();
}
