import 'package:dartz/dartz.dart';
import 'package:starwiki/core/erro/errors.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Error, Type>> call(Params params);
}
