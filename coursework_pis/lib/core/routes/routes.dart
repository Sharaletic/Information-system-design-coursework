import 'package:coursework_pis/core/dependency/dependencies.dart';
import 'package:coursework_pis/core/routes/routes_name.dart';
import 'package:coursework_pis/presentation/academic_load/pages/academic_load_page.dart';
import 'package:coursework_pis/presentation/auth/pages/login_page.dart';
import 'package:coursework_pis/presentation/person/pages/person_page.dart';
import 'package:coursework_pis/presentation/profile/pages/profile_page.dart';
import 'package:coursework_pis/presentation/report/pages/report_page.dart';
import 'package:coursework_pis/presentation/scaffold_with_navbar/scaffold_with_navbar.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final session = getIt<SupabaseClient>().auth.currentUser;

final GoRouter router =
    GoRouter(initialLocation: session == null ? '/login' : '/person', routes: [
  GoRoute(
    name: RoutesNames.login,
    path: '/login',
    builder: (context, state) => const LoginPage(),
  ),
  StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ScaffoldWithNavbar(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
            name: RoutesNames.teacher,
            path: '/person',
            builder: (context, state) => const PersonPage(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            name: RoutesNames.academicLoad,
            path: '/academic',
            builder: (context, state) => const AcademicLoadPage(),
          ),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            name: RoutesNames.report,
            path: '/report',
            builder: (context, state) => const ReportPage(),
          )
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            name: RoutesNames.profile,
            path: '/profile',
            builder: (context, state) => const ProfilePage(),
          )
        ]),
      ]),
]);
