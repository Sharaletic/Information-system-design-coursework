import 'package:coursework_pis/core/error/failure.dart';
import 'package:coursework_pis/data/models/academic_load/academic_load_dto.dart';
import 'package:coursework_pis/domain/models/full_academic_load.dart';
import 'package:coursework_pis/domain/repositories/academic_load_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/unit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:coursework_pis/data/services/user_service.dart';

import '../../core/utils/table_names.dart';
import '../../domain/models/academic_load.dart';
import '../models/full_academic_load/full_academic_load_dto.dart';

class AcademicLoadRepositoryImpl implements AcademicLoadRepository {
  AcademicLoadRepositoryImpl({
    required SupabaseClient supabaseClient,
    required UserService userService,
  })  : _supabaseClient = supabaseClient,
        _userService = userService;
  final SupabaseClient _supabaseClient;
  final UserService _userService;

  @override
  Future<Either<Failure, List<FullAcademicLoad>>> getAcademicLoad() async {
    try {
      final departmentIdResult = await _userService.getCurrentUserDepartment();

      return departmentIdResult
          .fold((failure) => left(Failure(message: failure.message)),
              (departmentId) async {
        final json = await _supabaseClient.rpc('get_academic_loads',
            params: {'_department_id': departmentId});
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

  @override
  Future<Either<Failure, Unit>> addAcademicLoad(
      {required AcademicLoad academicLoad}) async {
    try {
      final result = await _userService.getCurrentUserDepartment();

      return result.fold((failure) => left(Failure(message: failure.message)),
          (departmentId) async {
        final dto = AcademicLoadDto.fromDomain(academicLoad);
        dto.departmentId = departmentId;
        final json = dto.toJson();
        await _supabaseClient.from(TableNames.academicLoadTable).insert(json);
        return right(unit);
      });
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAcademicLoad({required String id}) async {
    try {
      await _supabaseClient
          .from(TableNames.participationTable)
          .delete()
          .eq('academic_load_id', id);
      await _supabaseClient
          .from(TableNames.academicLoadTable)
          .delete()
          .eq('id', id);
      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateAcademicLoad(
      {required AcademicLoad academicLoad}) async {
    try {
      final result = await _userService.getCurrentUserDepartment();

      return result.fold((failure) => left(Failure(message: failure.message)),
          (departmentId) async {
        final dto = AcademicLoadDto.fromDomain(academicLoad);
        dto.departmentId = departmentId;
        final json = dto.toJson();
        await _supabaseClient
            .from(TableNames.academicLoadTable)
            .update(json)
            .eq('id', dto.id);
        return right(unit);
      });
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
