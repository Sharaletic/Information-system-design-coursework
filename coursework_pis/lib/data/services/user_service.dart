import 'package:coursework_pis/core/error/failure.dart';
import 'package:coursework_pis/core/utils/table_names.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class UserService {
  Future<Either<Failure, String>> getCurrentUserDepartment();
}

class UserServiceImpl implements UserService {
  UserServiceImpl({required this.supabaseClient});
  final SupabaseClient supabaseClient;
  String cache = '';

  @override
  Future<Either<Failure, String>> getCurrentUserDepartment() async {
    try {
      if (cache.isNotEmpty) {
        return right(cache);
      } else {
        final departmentId = await supabaseClient
            .from(TableNames.personTable)
            .select('department_id')
            .eq('id', supabaseClient.auth.currentUser!.id)
            .single();

        final result = departmentId['department_id'];
        updateCache(result);
        return right(result);
      }
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  void updateCache(String data) {
    cache = data;
  }
}
