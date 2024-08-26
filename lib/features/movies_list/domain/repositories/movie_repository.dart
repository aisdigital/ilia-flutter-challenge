import 'package:movie_catalog/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_catalog/features/movies_list/domain/entities/theater_movies_response.dart';

abstract interface class MovieResponseRepository {
  Future<Either<Failure, TheaterMoviesResponse>> getTheaterMovies({
    required int page,
  });
}
