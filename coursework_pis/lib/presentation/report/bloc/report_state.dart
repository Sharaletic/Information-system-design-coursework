part of 'report_bloc.dart';

@freezed
class ReportState with _$ReportState {
  const factory ReportState.initial() = _Initial;
  const factory ReportState.loading() = _Loading;
  const factory ReportState.loaded({
    required List<FullAcademicLoad> academicLoads,
  }) = _Loaded;
  const factory ReportState.failure({
    required String message,
  }) = _Failure;
}
