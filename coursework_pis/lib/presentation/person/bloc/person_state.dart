part of 'person_bloc.dart';

@freezed
class PersonState with _$PersonState {
  const factory PersonState.loading() = _Loading;
  const factory PersonState.loaded({
    required List<Person> person,
  }) = _Loaded;
  const factory PersonState.failure({
    required String message,
  }) = _Failure;
}
