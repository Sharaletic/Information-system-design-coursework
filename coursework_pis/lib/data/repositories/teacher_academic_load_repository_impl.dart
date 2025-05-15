import 'package:coursework_pis/core/error/failure.dart';
import 'package:coursework_pis/domain/models/full_academic_load.dart';
import 'package:coursework_pis/domain/repositories/teacher_academic_load_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/full_academic_load/full_academic_load_dto.dart';
import '../services/user_service.dart';

class TeacherAcademicLoadRepositoryImpl
    implements TeacherAcademicLoadRepository {
  TeacherAcademicLoadRepositoryImpl({
    required SupabaseClient supabaseClient,
    required this.sharedPreferences,
  }) : _supabaseClient = supabaseClient;
  final SupabaseClient _supabaseClient;
  final SharedPreferences sharedPreferences;

  @override
  Future<Either<Failure, List<FullAcademicLoad>>>
      getAcademicLoadForTeacher() async {
    final json = await _supabaseClient.rpc('get_academic_load_for_teacher',
        params: {'_person_id': sharedPreferences.getString('id')});
    if (json == null) {
      return left(Failure(message: 'Учебных нагрузок нет'));
    }
    List<FullAcademicLoad> academicLoads = json
        .map((element) => FullAcademicLoadDto.fromJson(element).toDomain())
        .toList()
        .cast<FullAcademicLoad>();
    return right(academicLoads);
  }
}
