import 'package:coursework_pis/core/error/failure.dart';
import 'package:coursework_pis/core/utils/table_names.dart';
import 'package:coursework_pis/data/models/discipline/discipline_dto.dart';
import 'package:coursework_pis/data/services/user_service.dart';
import 'package:coursework_pis/domain/models/discipline.dart';
import 'package:coursework_pis/domain/repositories/discipline_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DisciplineRepositoryImpl implements DisciplineRepository {
  DisciplineRepositoryImpl(
      {required this.supabaseClient, required this.userService});
  final SupabaseClient supabaseClient;
  final UserService userService;

  @override
  Future<Either<Failure, List<Discipline>>> getDisciplines() async {
    try {
      final result = await userService.getCurrentUserDepartment();

      return result.fold((failure) => left(Failure(message: failure.message)),
          (departmentId) async {
        final json = await supabaseClient
            .from(TableNames.disciplineTable)
            .select()
            .eq('department_id', departmentId);
        List<Discipline> disciplines = json
            .map((element) => DisciplineDto.fromJson(element).toDomain())
            .toList();
        return right(disciplines);
      });
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
