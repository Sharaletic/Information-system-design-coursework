import 'package:coursework_pis/core/error/failure.dart';
import 'package:coursework_pis/domain/models/full_academic_load.dart';
import 'package:coursework_pis/domain/repositories/report_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/full_academic_load/full_academic_load_dto.dart';
import '../services/user_service.dart';

class ReportRepositoryImpl implements ReportRepository {
  ReportRepositoryImpl({
    required SupabaseClient supabaseClient,
    required UserService userService,
  })  : _supabaseClient = supabaseClient,
        _userService = userService;
  final SupabaseClient _supabaseClient;
  final UserService _userService;

  @override
  Future<Either<Failure, List<FullAcademicLoad>>> getFilterAcademicLoad({
    required String? semester,
    required String? appointmentDate,
    required String? namePerson,
  }) async {
    try {
      final departmentIdResult = await _userService.getCurrentUserDepartment();

      return departmentIdResult
          .fold((failure) => left(Failure(message: failure.message)),
              (departmentId) async {
        final json = await _supabaseClient.rpc('filter_academic_load', params: {
          '_appointment_year': appointmentDate == "" ? null : appointmentDate,
          '_full_name': namePerson == "" ? null : namePerson,
          '_semester': semester == "" ? null : int.parse(semester!),
          '_department_id': departmentId
        });
        if (json == null) {
          return left(Failure(message: 'Учебных нагрузок нет'));
        }
        List<FullAcademicLoad> academicLoads = json
            .map((element) => FullAcademicLoadDto.fromJson(element).toDomain())
            .toList()
            .cast<FullAcademicLoad>();
        return right(academicLoads);
      });
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
