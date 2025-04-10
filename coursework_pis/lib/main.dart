import 'package:coursework_pis/core/dependency/dependencies.dart';
import 'package:coursework_pis/core/routes/routes.dart';
import 'package:coursework_pis/core/theme/app_theme.dart';
import 'package:coursework_pis/presentation/person/bloc/person_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await setup();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => getIt<PersonBloc>()..add(PersonEvent.load()))
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
