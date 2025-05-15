import 'package:coursework_pis/domain/repositories/report_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/models/full_academic_load.dart';
part 'report_event.dart';
part 'report_state.dart';
part 'report_bloc.freezed.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final ReportRepository reportRepository;
  ReportBloc({
    required this.reportRepository,
  }) : super(ReportState.initial()) {
    on<ReportEvent>((event, emit) async {
      await event.map(
        load: (event) => _onLoad(event, emit),
      );
    });
  }

  Future<void> _onLoad(_Load event, Emitter<ReportState> emit) async {
    emit(ReportState.loading());
    final result = await reportRepository.getFilterAcademicLoad(
      appointmentDate: event.appointmentDate,
      semester: event.semester,
      namePerson: event.namePerson,
    );
    result.fold(
        (failure) => emit(ReportState.failure(message: failure.message)),
        (academicLoads) =>
            emit(ReportState.loaded(academicLoads: academicLoads)));
  }
}
