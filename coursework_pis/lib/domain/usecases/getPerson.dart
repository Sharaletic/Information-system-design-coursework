import 'package:coursework_pis/core/error/failure.dart';
import 'package:coursework_pis/core/usecases/usecase.dart';
import 'package:coursework_pis/domain/models/person.dart';
import 'package:coursework_pis/domain/repositories/person_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetPerson extends UseCase<List<Person>> {
  GetPerson({
    required this.personRepository,
  });
  final PersonRepository personRepository;

  @override
  Future<Either<Failure, List<Person>>> call() async {
    final json = await personRepository.getPerson();

    return json.fold((failure) => left(Failure(message: failure.message)),
        (person) {
      List<Person> allPerson = [];
      person.map((element) {
        if (element.id == personRepository.currentUserId) {
          allPerson.insert(0, element);
        } else {
          allPerson.add(element);
        }
      }).toList();
      return right(allPerson);
    });
  }
}
