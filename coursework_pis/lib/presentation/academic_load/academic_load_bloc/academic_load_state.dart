part of 'academic_load_bloc.dart';

@freezed
class AcademicLoadState with _$AcademicLoadState {
  const factory AcademicLoadState.loading() = _Loading;
  const factory AcademicLoadState.loaded({
    required List<FullAcademicLoad> academicLoads,
  }) = _Loaded;
  const factory AcademicLoadState.failure({
    required String message,
  }) = _Failure;
}
