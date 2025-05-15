part of 'teacher_academic_load_bloc.dart';

@freezed
class TeacherAcademicLoadState with _$TeacherAcademicLoadState {
  const factory TeacherAcademicLoadState.loading() = _Loading;
  const factory TeacherAcademicLoadState.loaded({
    required List<FullAcademicLoad> academicLoads,
  }) = _Loaded;
  const factory TeacherAcademicLoadState.failure({
    required String message,
  }) = _Failure;
}