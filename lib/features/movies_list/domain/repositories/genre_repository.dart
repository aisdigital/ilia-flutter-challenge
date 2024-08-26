import 'package:movie_catalog/core/common/entities/genre.dart';
import 'package:movie_catalog/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class GenreRepository {
  Future<Either<Failure, List<Genre>>> getGenres();
}
