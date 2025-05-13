part of 'academic_load_bloc.dart';

@freezed
class AcademicLoadEvent with _$AcademicLoadEvent {
  const factory AcademicLoadEvent.load() = _Load;
  const factory AcademicLoadEvent.addAcademicLoad({
    required AcademicLoad academicLoad,
  }) = _AddAcademicLoad;
  const factory AcademicLoadEvent.deleteAcademicLoad({
    required String id,
  }) = _DeleteAcademicLoad;
  const factory AcademicLoadEvent.updateAcademicLoad({
    required AcademicLoad academicLoad,
  }) = _UpdateAcademicLoad;
}
