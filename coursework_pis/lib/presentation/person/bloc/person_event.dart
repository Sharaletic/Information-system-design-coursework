part of 'person_bloc.dart';

@freezed
class PersonEvent with _$PersonEvent {
  const factory PersonEvent.load() = _Load;
  const factory PersonEvent.addPerson({
    required Person person,
  }) = _AddPerson;
  const factory PersonEvent.deletePerson({
    required String id,
  }) = _DeletePerson;
  const factory PersonEvent.updatePerson({
    required Person person,
  }) = _UpdatePerson;
}
