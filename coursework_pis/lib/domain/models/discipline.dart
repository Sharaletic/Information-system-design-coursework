import 'package:equatable/equatable.dart';

class Discipline extends Equatable {
  const Discipline({
    this.id,
    this.disciplineTitle,
    this.departmentId,
  });
  final String? id;
  final String? disciplineTitle;
  final String? departmentId;

  @override
  List<Object?> get props => [id, disciplineTitle, departmentId];
}
