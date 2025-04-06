import 'package:coursework_pis/core/dependency/dependencies.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final session = getIt<SupabaseClient>().auth.currentUser;

final GoRoute route = GoRouter(routes: []) as GoRoute;
