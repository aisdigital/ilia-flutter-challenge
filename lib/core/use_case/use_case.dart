import 'package:fpdart/fpdart.dart';
import 'package:movie_catalog/core/error/failure.dart';

abstract interface class UseCase<Success, Params> {
  Future<Either<Failure, Success>> call(Params params);
}

class NoParams {}
