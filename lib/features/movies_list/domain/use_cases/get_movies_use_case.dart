import 'package:fpdart/fpdart.dart';
import 'package:movie_catalog/core/error/failure.dart';
import 'package:movie_catalog/core/use_case/use_case.dart';
import 'package:movie_catalog/features/movies_list/domain/entities/theater_movies_response.dart';
import 'package:movie_catalog/features/movies_list/domain/repositories/movie_repository.dart';

class GetMoviesUseCase implements UseCase {
  final MovieResponseRepository movieRepository;

  const GetMoviesUseCase(
    this.movieRepository,
  );

  @override
  Future<Either<Failure, TheaterMoviesResponse>> call(page) async {
    final theaterMovies = await movieRepository.getTheaterMovies(page: page);

    return theaterMovies;
  }
}
