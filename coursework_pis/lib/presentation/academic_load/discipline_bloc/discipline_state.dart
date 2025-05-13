part of 'discipline_bloc.dart';

@freezed
class DisciplineState with _$DisciplineState {
  const factory DisciplineState.loading() = _Loading;
  const factory DisciplineState.loaded({
    required List<Discipline> disciplines,
  }) = _Loaded;
  const factory DisciplineState.failure({
    required String message,
  }) = _Failure;
}
