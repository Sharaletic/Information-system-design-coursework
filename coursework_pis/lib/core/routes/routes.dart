import 'package:coursework_pis/core/dependency/dependencies.dart';
import 'package:coursework_pis/core/routes/routes_name.dart';
import 'package:coursework_pis/domain/models/full_academic_load.dart';
import 'package:coursework_pis/presentation/academic_load/pages/academic_load_page.dart';
import 'package:coursework_pis/presentation/academic_load/pages/add_academic_load_page.dart';
import 'package:coursework_pis/presentation/academic_load/pages/teacher_appointment_page.dart';
import 'package:coursework_pis/presentation/auth/pages/login_page.dart';
import 'package:coursework_pis/presentation/person/pages/person_page.dart';
import 'package:coursework_pis/presentation/profile/pages/profile_page.dart';
import 'package:coursework_pis/presentation/report/pages/report_page.dart';
import 'package:coursework_pis/presentation/scaffold_with_navbar/scaffold_with_navbar.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../presentation/academic_load/pages/edit_academic_load_page.dart';
import '../../presentation/teacher_academic_load/pages/teacher_academic_load_page.dart';

final session = getIt<SharedPreferences>().getString('id');
final status = getIt<SharedPreferences>().getString('status');

final GoRouter router = GoRouter(
  initialLocation: session != null
      ? '/login'
      : (getIt<SharedPreferences>().getString('role') == 'Преподаватель'
          ? '/teacherAcademicLoad'
          : '/person'),
  routes: [
    GoRoute(
      name: RoutesNames.login,
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: RoutesNames.teacherAcademicLoad,
      path: '/teacherAcademicLoad',
      builder: (context, state) => const TeacherAcademicLoadPage(),
    ),
    GoRoute(
      name: RoutesNames.addAcademicLoad,
      path: '/add_academic_load',
      builder: (context, state) => const AddAcademicLoadPage(),
    ),
    GoRoute(
      name: RoutesNames.editAcademicLoad,
      path: '/edit_academic_load',
      builder: (context, state) {
        FullAcademicLoad academicLoad = state.extra as FullAcademicLoad;
        return EditAcademicLoadPage(academicLoad: academicLoad);
      },
    ),
    GoRoute(
        name: RoutesNames.teacherAppointment,
        path: '/teacher_appointment/:academicLoadId',
        builder: (context, state) => TeacherAppointmentPage(
              academicLoadId: state.pathParameters['academicLoadId']!,
            )),
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
      ],
    ),
  ],
);
