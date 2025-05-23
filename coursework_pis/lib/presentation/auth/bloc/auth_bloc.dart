import 'package:coursework_pis/domain/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/person_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  AuthBloc({required this.repository}) : super(AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(login: (event) => _login(event, emit));
    });
  }

  Future<void> _login(_Login event, Emitter<AuthState> emit) async {
    emit(AuthState.loading());
    final result =
        await repository.login(login: event.login, password: event.password);

    result.fold((failure) => emit(AuthState.failure(message: failure.message)),
        (person) => emit(AuthState.success(person: person)));
  }
}
