import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_catalog/core/error/failure.dart';
import 'package:movie_catalog/features/movies_list/data/data_sources/movies_list_remote_data_source.dart';
import 'package:movie_catalog/features/movies_list/domain/entities/theater_movies_response.dart';
import 'package:movie_catalog/features/movies_list/domain/repositories/movie_repository.dart';

class MovieResponseRepositoryImpl implements MovieResponseRepository {
  final MoviesListRemoteDataSource moviesListRemoteDataSource;

  const MovieResponseRepositoryImpl(
    this.moviesListRemoteDataSource,
  );

  @override
  Future<Either<Failure, TheaterMoviesResponse>> getTheaterMovies({
    required int page,
  }) async {
    try {
      return Right(
        await moviesListRemoteDataSource.getMovies(page),
      );
    } on DioException catch (e) {
      return Left(
        Failure(
          errorMessage: e.message ?? '',
        ),
      );
    }
  }
}
