import 'package:coursework_pis/domain/models/person_auth.dart';
import 'package:coursework_pis/domain/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;
  AuthBloc(this._repository) : super(AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      event.map(login: (event) => _login(event, emit));
    });
  }

  Future<void> _login(_Login event, Emitter<AuthState> emit) async {
    emit(AuthState.loading());
    final result =
        await _repository.login(login: event.login, password: event.password);

    result.fold((failure) => emit(AuthState.failure(message: failure.message)),
        (person) => emit(AuthState.success(personAuth: person)));
  }
}
