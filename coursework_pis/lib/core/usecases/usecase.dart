import 'package:coursework_pis/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}