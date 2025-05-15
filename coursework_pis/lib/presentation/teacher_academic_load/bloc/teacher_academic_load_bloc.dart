import 'package:coursework_pis/domain/repositories/teacher_academic_load_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/models/full_academic_load.dart';
part 'teacher_academic_load_event.dart';
part 'teacher_academic_load_state.dart';
part 'teacher_academic_load_bloc.freezed.dart';

class TeacherAcademicLoadBloc
    extends Bloc<TeacherAcademicLoadEvent, TeacherAcademicLoadState> {
  final TeacherAcademicLoadRepository reportRepository;
  TeacherAcademicLoadBloc({
    required this.reportRepository,
  }) : super(TeacherAcademicLoadState.loading()) {
    on<TeacherAcademicLoadEvent>((event, emit) async {
      await event.map(
        load: (event) => _onLoad(event, emit),
      );
    });
  }

  Future<void> _onLoad(
      _Load event, Emitter<TeacherAcademicLoadState> emit) async {
    emit(TeacherAcademicLoadState.loading());
    final result = await reportRepository.getAcademicLoadForTeacher();
    result.fold(
        (failure) =>
            emit(TeacherAcademicLoadState.failure(message: failure.message)),
        (academicLoads) => emit(
            TeacherAcademicLoadState.loaded(academicLoads: academicLoads)));
  }
}
