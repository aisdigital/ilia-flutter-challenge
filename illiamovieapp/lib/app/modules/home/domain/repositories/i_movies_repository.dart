import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/movie_entity.dart';

abstract class IMoviesRepository {
  Future<Either<IFailure, List<Movie>>> getMoviesInTheatre({
    required String language,
    required int page,
  });
}
