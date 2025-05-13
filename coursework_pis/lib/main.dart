import 'package:coursework_pis/core/dependency/dependencies.dart';
import 'package:coursework_pis/core/routes/routes.dart';
import 'package:coursework_pis/core/theme/app_theme.dart';
import 'package:coursework_pis/presentation/academic_load/academic_load_bloc/academic_load_bloc.dart';
import 'package:coursework_pis/presentation/academic_load/discipline_bloc/discipline_bloc.dart';
import 'package:coursework_pis/presentation/auth/bloc/auth_bloc.dart';
import 'package:coursework_pis/presentation/person/bloc/person_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await setup();
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting("RU-ru");
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => getIt<AuthBloc>()),
    BlocProvider(create: (_) => getIt<PersonBloc>()..add(PersonEvent.load())),
    BlocProvider(
        create: (_) =>
            getIt<AcademicLoadBloc>()..add(AcademicLoadEvent.load())),
    BlocProvider(
        create: (_) => getIt<DisciplineBloc>()..add(DisciplineEvent.load())),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
