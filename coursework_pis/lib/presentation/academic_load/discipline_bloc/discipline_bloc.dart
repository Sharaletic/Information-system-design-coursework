import 'package:coursework_pis/domain/models/discipline.dart';
import 'package:coursework_pis/domain/repositories/discipline_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'discipline_event.dart';
part 'discipline_state.dart';
part 'discipline_bloc.freezed.dart';

class DisciplineBloc extends Bloc<DisciplineEvent, DisciplineState> {
  final DisciplineRepository repository;

  DisciplineBloc({
    required this.repository,
  }) : super(DisciplineState.loading()) {
    on<DisciplineEvent>((event, emit) async {
      await event.map(
        load: (event) => _onLoad(event, emit),
      );
    });
  }

  Future<void> _onLoad(_Load event, Emitter<DisciplineState> emit) async {
    final result = await repository.getDisciplines();
    result.fold(
        (failure) => emit(DisciplineState.failure(message: failure.message)),
        (disciplines) =>
            emit(DisciplineState.loaded(disciplines: disciplines)));
  }
}
