import 'package:coursework_pis/core/secrets/secrets.dart';
import 'package:coursework_pis/data/datasource/auth_remote_data_source.dart';
import 'package:coursework_pis/data/repositories/academic_load_repository_impl.dart';
import 'package:coursework_pis/data/repositories/auth_repository_impl.dart';
import 'package:coursework_pis/data/repositories/discipline_repository_impl.dart';
import 'package:coursework_pis/data/repositories/person_repository_impl.dart';
import 'package:coursework_pis/data/services/user_service.dart';
import 'package:coursework_pis/domain/models/person.dart';
import 'package:coursework_pis/domain/repositories/academic_load_repository.dart';
import 'package:coursework_pis/domain/repositories/auth_repository.dart';
import 'package:coursework_pis/domain/repositories/discipline_repository.dart';
import 'package:coursework_pis/domain/repositories/person_repository.dart';
import 'package:coursework_pis/domain/usecases/getPerson.dart';
import 'package:coursework_pis/presentation/academic_load/discipline_bloc/discipline_bloc.dart';
import 'package:coursework_pis/presentation/auth/bloc/auth_bloc.dart';
import 'package:coursework_pis/presentation/person/bloc/person_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../presentation/academic_load/academic_load_bloc/academic_load_bloc.dart';
import '../usecases/usecase.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final supabase = await Supabase.initialize(
      url: AppSecrets.url, anonKey: AppSecrets.anonKey);
  getIt.registerLazySingleton<SupabaseClient>(() => supabase.client);

  _initAuth();

  final SharedPreferences preferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => preferences);

  _initPerson();

  _initAcademicLoad();

  _initDiscipline();
}

void _initAuth() {
  getIt.registerLazySingleton<AuthRemoteDataSource>(() =>
      AuthRemoteDataSourceImpl(
          supabaseClient: getIt<SupabaseClient>(),
          sharedPreferences: getIt<SharedPreferences>()));

  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      supabaseClient: getIt<SupabaseClient>()));

  getIt.registerLazySingleton<AuthBloc>(
      () => AuthBloc(repository: getIt<AuthRepository>()));
}

void _initPerson() {
  getIt.registerLazySingleton<UserService>(() => UserServiceImpl(
      supabaseClient: getIt<SupabaseClient>(),
      sharedPreferences: getIt<SharedPreferences>()));

  getIt.registerLazySingleton<PersonRepository>(() => PersonRepositoryImpl(
      supabaseClient: getIt<SupabaseClient>(),
      userService: getIt<UserService>(),
      sharedPreferences: getIt<SharedPreferences>()));

  getIt.registerLazySingleton<UseCase<List<Person>>>(() => GetPerson(
      personRepository: getIt<PersonRepository>(),
      sharedPreferences: getIt<SharedPreferences>()));

  getIt.registerLazySingleton<PersonBloc>(() => PersonBloc(
      repository: getIt<PersonRepository>(),
      getPerson: getIt<UseCase<List<Person>>>()));
}

void _initAcademicLoad() {
  getIt.registerLazySingleton<AcademicLoadRepository>(() =>
      AcademicLoadRepositoryImpl(
          supabaseClient: getIt<SupabaseClient>(),
          userService: getIt<UserService>()));

  getIt.registerLazySingleton<AcademicLoadBloc>(
      () => AcademicLoadBloc(repository: getIt<AcademicLoadRepository>()));
}

void _initDiscipline() {
  getIt.registerLazySingleton<DisciplineRepository>(() =>
      DisciplineRepositoryImpl(
          supabaseClient: getIt<SupabaseClient>(),
          userService: getIt<UserService>()));

  getIt.registerLazySingleton<DisciplineBloc>(
      () => DisciplineBloc(repository: getIt<DisciplineRepository>()));
}
