import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_catalog/core/common/entities/genre.dart';
import 'package:movie_catalog/core/error/failure.dart';
import 'package:movie_catalog/features/movies_list/data/data_sources/genre_remote_data_source.dart';
import 'package:movie_catalog/features/movies_list/domain/repositories/genre_repository.dart';

class GenreRepositoryImpl implements GenreRepository {
  final GenreRemoteDataSource genreRemoteDataSource;

  const GenreRepositoryImpl(
    this.genreRemoteDataSource,
  );

  @override
  Future<Either<Failure, List<Genre>>> getGenres() async {
    try {
      return Right(
        await genreRemoteDataSource.getGenres(),
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
