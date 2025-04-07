import 'package:coursework_pis/core/secrets/secrets.dart';
import 'package:coursework_pis/data/repositories/person_repository_impl.dart';
import 'package:coursework_pis/domain/repositories/person_repository.dart';
import 'package:coursework_pis/presentation/person/bloc/person_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final supabase = await Supabase.initialize(
    url: AppSecrets.url,
    anonKey: AppSecrets.anonKey,
  );
  getIt.registerLazySingleton<SupabaseClient>(() => supabase.client);

  final SharedPreferences preferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => preferences);

  _initPerson();
}

void _initPerson() {
  getIt.registerLazySingleton<PersonRepository>(
      () => PersonRepositoryImpl(supabaseClient: getIt<SupabaseClient>()));

  getIt.registerLazySingleton<PersonBloc>(
      () => PersonBloc(repository: getIt<PersonRepository>()));
}
