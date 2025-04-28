import 'package:coursework_pis/core/usecases/usecase.dart';
import 'package:coursework_pis/domain/models/person.dart';
import 'package:coursework_pis/domain/repositories/person_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'person_event.dart';
part 'person_state.dart';
part 'person_bloc.freezed.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonRepository repository;
  final UseCase<List<Person>> getPerson;
  PersonBloc({required this.repository, required this.getPerson})
      : super(PersonState.loading()) {
    on<PersonEvent>((event, emit) async {
      await event.map(
        load: (event) => _onLoad(event, emit),
        addPerson: (event) => _onAddPerson(event, emit),
        deletePerson: (event) => _onDeletePerson(event, emit),
        updatePerson: (event) => _onUpdatePerson(event, emit),
      );
    });
  }

  Future<void> _onLoad(_Load event, Emitter<PersonState> emit) async {
    emit(PersonState.loading());
    final result = await getPerson();
    result.fold(
        (failure) => emit(PersonState.failure(message: failure.message)),
        (person) => emit(PersonState.loaded(person: person)));
  }

  Future<void> _onAddPerson(_AddPerson event, Emitter<PersonState> emit) async {
    final result = await repository.addUser(person: event.person);
    result.fold(
        (failure) => emit(PersonState.failure(message: failure.message)),
        (unit) => add(PersonEvent.load()));
  }

  Future<void> _onDeletePerson(
      _DeletePerson event, Emitter<PersonState> emit) async {
    final result = await repository.deletePerson(id: event.id);
    result.fold(
        (failure) => emit(PersonState.failure(message: failure.message)),
        (unit) => add(PersonEvent.load()));
  }

  Future<void> _onUpdatePerson(
      _UpdatePerson event, Emitter<PersonState> emit) async {
    final result = await repository.updatePerson(person: event.person);
    result.fold(
        (failure) => emit(PersonState.failure(message: failure.message)),
        (unit) => add(PersonEvent.load()));
  }
}
