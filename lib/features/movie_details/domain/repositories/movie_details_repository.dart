import 'package:fpdart/fpdart.dart';
import 'package:movie_catalog/core/error/failure.dart';
import 'package:movie_catalog/features/movie_details/domain/entities/movie_details.dart';

abstract interface class MovieDetailsRepository {
  Future<Either<Failure, MovieDetails>> getMovieDetails({
    required int id,
  });
}
