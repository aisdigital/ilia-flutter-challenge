import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<IFailure, Type>> call(Params params);
}

abstract class UseCaseSync<Type, Params> {
  Either<IFailure, Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

void voidRight;
