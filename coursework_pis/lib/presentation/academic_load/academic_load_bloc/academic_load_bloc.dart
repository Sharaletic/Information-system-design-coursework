import 'package:coursework_pis/domain/models/academic_load.dart';
import 'package:coursework_pis/domain/models/full_academic_load.dart';
import 'package:coursework_pis/domain/repositories/academic_load_repository.dart';
import 'package:coursework_pis/domain/repositories/participation_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/person.dart';

part 'academic_load_event.dart';
part 'academic_load_state.dart';
part 'academic_load_bloc.freezed.dart';

class AcademicLoadBloc extends Bloc<AcademicLoadEvent, AcademicLoadState> {
  final AcademicLoadRepository academicLoadRepository;
  final ParticipationRepository participationRepository;
  AcademicLoadBloc({
    required this.academicLoadRepository,
    required this.participationRepository,
  }) : super(AcademicLoadState.loading()) {
    on<AcademicLoadEvent>((event, emit) async {
      await event.map(
        load: (event) => _onLoad(event, emit),
        addAcademicLoad: (event) => _onAddAcademicLoad(event, emit),
        deleteAcademicLoad: (event) => _onDeleteAcademicLoad(event, emit),
        updateAcademicLoad: (event) => _onUpdateAcademicLoad(event, emit),
        updateParticipation: (event) => _onUpdateParticipation(event, emit),
        addParticipation: (event) => _onAddParticipation(event, emit),
      );
    });
  }

  Future<void> _onLoad(_Load event, Emitter<AcademicLoadState> emit) async {
    emit(AcademicLoadState.loading());
    final result = await academicLoadRepository.getAcademicLoad();
    result.fold(
        (failure) => emit(AcademicLoadState.failure(message: failure.message)),
        (academicLoads) =>
            emit(AcademicLoadState.loaded(academicLoads: academicLoads)));
  }

  Future<void> _onAddAcademicLoad(
      _AddAcademicLoad event, Emitter<AcademicLoadState> emit) async {
    final result = await academicLoadRepository.addAcademicLoad(
        academicLoad: event.academicLoad);
    result.fold(
        (failure) => emit(AcademicLoadState.failure(message: failure.message)),
        (unit) => add(AcademicLoadEvent.load()));
  }

  Future<void> _onDeleteAcademicLoad(
      _DeleteAcademicLoad event, Emitter<AcademicLoadState> emit) async {
    final result =
        await academicLoadRepository.deleteAcademicLoad(id: event.id);
    result.fold(
        (failure) => emit(AcademicLoadState.failure(message: failure.message)),
        (unit) => add(AcademicLoadEvent.load()));
  }

  Future<void> _onUpdateAcademicLoad(
      _UpdateAcademicLoad event, Emitter<AcademicLoadState> emit) async {
    final result = await academicLoadRepository.updateAcademicLoad(
        academicLoad: event.academicLoad);
    result.fold(
        (failure) => emit(AcademicLoadState.failure(message: failure.message)),
        (unit) => add(AcademicLoadEvent.load()));
  }

  Future<void> _onUpdateParticipation(
      _UpdateParticipation event, Emitter<AcademicLoadState> emit) async {
    final result = await participationRepository.updateParticipation(
      person: event.person,
      academicLoadId: event.academicLoadId,
    );
    result.fold(
        (failure) => emit(AcademicLoadState.failure(message: failure.message)),
        (unit) => add(AcademicLoadEvent.load()));
  }

  Future<void> _onAddParticipation(
      _AddParticipation event, Emitter<AcademicLoadState> emit) async {
    final result = await participationRepository.addParticipation(
      person: event.person,
      academicLoadId: event.academicLoadId,
    );
    result.fold(
        (failure) => emit(AcademicLoadState.failure(message: failure.message)),
        (unit) => add(AcademicLoadEvent.load()));
  }
}
