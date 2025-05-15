part of 'report_bloc.dart';

@freezed
class ReportEvent with _$ReportEvent {
  const factory ReportEvent.load({
    required String? appointmentDate,
    required String? semester,
    required String? namePerson,
  }) = _Load;
}
