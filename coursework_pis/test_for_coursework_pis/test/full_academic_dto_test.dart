import 'package:coursework_pis/data/models/discipline/discipline_dto.dart';
import 'package:coursework_pis/data/models/full_academic_load/full_academic_load_dto.dart';
import 'package:coursework_pis/data/models/person/person_dto.dart';
import 'package:coursework_pis/domain/models/discipline.dart';
import 'package:coursework_pis/domain/models/full_academic_load.dart';
import 'package:coursework_pis/domain/models/person.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dto = FullAcademicLoadDto(
    id: '1',
    person: PersonDto(
      fullName: 'fullName',
      post: 'Доцент',
    ),
    discipline: DisciplineDto(
      id: '1',
      disciplineTitle: 'disciplineTitle',
      departmentId: '1',
    ),
    lessonType: 'lessonType',
    quantityHours: 25,
    group: 'group',
    appointmentYear: 2020,
    semester: 1,
  );

  final model = FullAcademicLoad(
    id: '1',
    person: Person(
      fullName: 'fullName',
      post: 'Доцент',
    ),
    discipline: Discipline(
      id: '1',
      disciplineTitle: 'disciplineTitle',
      departmentId: '1',
    ),
    lessonType: 'lessonType',
    quantityHours: 25,
    group: 'group',
    appointmentYear: 2020,
    semester: 1,
  );

  test('PersonDto to domain', () {
    final result = dto.toDomain();
    expect(result, model);
  });
}
