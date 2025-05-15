import 'package:coursework_pis/data/models/person/person_dto.dart';
import 'package:coursework_pis/domain/models/person.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dto = PersonDto(
    id: 'id',
    fullName: 'fullName',
    post: 'post',
    academicDegree: 'academicDegree',
    workExperience: 'workExperience',
    departmentId: 'departmentId',
    role: 'Преподаватель',
    login: 'login',
    password: 'password',
  );

  final model = Person(
    id: 'id',
    fullName: 'fullName',
    post: 'post',
    academicDegree: 'academicDegree',
    workExperience: 'workExperience',
    departmentId: 'departmentId',
    role: RolePerson.teacher,
    login: 'login',
    password: 'password',
  );

  test('PersonDto to domain', () {
    final result = dto.toDomain();
    expect(result, model);
  });
}
