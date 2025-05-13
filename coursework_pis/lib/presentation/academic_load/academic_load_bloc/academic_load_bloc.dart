import 'package:coursework_pis/domain/models/academic_load.dart';
import 'package:coursework_pis/domain/models/full_academic_load.dart';
import 'package:coursework_pis/domain/repositories/academic_load_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'academic_load_event.dart';
part 'academic_load_state.dart';
part 'academic_load_bloc.freezed.dart';

class AcademicLoadBloc extends Bloc<AcademicLoadEvent, AcademicLoadState> {
  final AcademicLoadRepository repository;
  AcademicLoadBloc({
    required this.repository,
  }) : super(AcademicLoadState.loading()) {
    on<AcademicLoadEvent>((event, emit) async {
      await event.map(
        load: (event) => _onLoad(event, emit),
        addAcademicLoad: (event) => _onAddAcademicLoad(event, emit),
        deleteAcademicLoad: (event) => _onDeleteAcademicLoad(event, emit),
        updateAcademicLoad: (event) => _onUpdateAcademicLoad(event, emit),
      );
    });
  }

  Future<void> _onLoad(_Load event, Emitter<AcademicLoadState> emit) async {
    emit(AcademicLoadState.loading());
    final result = await repository.getAcademicLoad();
    result.fold(
        (failure) => emit(AcademicLoadState.failure(message: failure.message)),
        (academicLoads) =>
            emit(AcademicLoadState.loaded(academicLoads: academicLoads)));
  }

  Future<void> _onAddAcademicLoad(
      _AddAcademicLoad event, Emitter<AcademicLoadState> emit) async {
    final result =
        await repository.addAcademicLoad(academicLoad: event.academicLoad);
    result.fold(
        (failure) => emit(AcademicLoadState.failure(message: failure.message)),
        (unit) => add(AcademicLoadEvent.load()));
  }

  Future<void> _onDeleteAcademicLoad(
      _DeleteAcademicLoad event, Emitter<AcademicLoadState> emit) async {
    final result = await repository.deleteAcademicLoad(id: event.id);
    result.fold(
        (failure) => emit(AcademicLoadState.failure(message: failure.message)),
        (unit) => add(AcademicLoadEvent.load()));
  }

  Future<void> _onUpdateAcademicLoad(
      _UpdateAcademicLoad event, Emitter<AcademicLoadState> emit) async {
    final result =
        await repository.updateAcademicLoad(academicLoad: event.academicLoad);
    result.fold(
        (failure) => emit(AcademicLoadState.failure(message: failure.message)),
        (unit) => add(AcademicLoadEvent.load()));
  }
}
