import 'package:coursework_pis/core/secrets/secrets.dart';
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
}
