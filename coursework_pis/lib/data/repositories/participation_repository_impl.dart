import 'package:coursework_pis/core/error/failure.dart';
import 'package:coursework_pis/domain/models/person.dart';
import 'package:coursework_pis/domain/repositories/participation_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/src/unit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/utils/table_names.dart';

class ParticipationRepositoryImpl implements ParticipationRepository {
  ParticipationRepositoryImpl({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;
  final SupabaseClient _supabaseClient;

  @override
  Future<Either<Failure, Unit>> addParticipation(
      {required Person person, required String academicLoadId}) async {
    try {
      await _supabaseClient
          .from(TableNames.participationTable)
          .insert({'person_id': person.id, 'academic_load_id': academicLoadId});
      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateParticipation(
      {required Person person, required String academicLoadId}) async {
    try {
      await _supabaseClient.from(TableNames.participationTable).update(
          {'person_id': person.id}).eq('academic_load_id', academicLoadId);
      return right(unit);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
