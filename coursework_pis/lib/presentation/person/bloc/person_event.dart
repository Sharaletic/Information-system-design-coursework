part of 'person_bloc.dart';

@freezed
class PersonEvent with _$PersonEvent {
  const factory PersonEvent.load({
    required String idDepartment,
  }) = _Load;
  const factory PersonEvent.addPerson({
    required Person person,
    required String idDepartment,
  }) = _AddPerson;
  const factory PersonEvent.deletePerson({
    required String id,
    required String idDepartment,
  }) = _DeletePerson;
  const factory PersonEvent.updatePerson({
    required Person person,
    required String idDepartment,
  }) = _UpdatePerson;
}
