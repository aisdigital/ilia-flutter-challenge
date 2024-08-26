import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_catalog/core/error/failure.dart';
import 'package:movie_catalog/features/movie_details/data/data_sources/movie_videos_response_remote_data_source.dart';
import 'package:movie_catalog/features/movie_details/domain/entities/movie_videos_response.dart';
import 'package:movie_catalog/features/movie_details/domain/repositories/movie_videos_response_repository.dart';

class MovieVideosResponseRepositoryImpl implements MovieVideosResponseRepository {
  final MovieVideosResponseRemoteDataSource movieVideosResponseRemoteDataSource;

  const MovieVideosResponseRepositoryImpl(
    this.movieVideosResponseRemoteDataSource,
  );
  @override
  Future<Either<Failure, MovieVideosResponse>> getMovieVideosResponse({required int id}) async {
    try {
      return Right(
        await movieVideosResponseRemoteDataSource.getMovieVideos(id),
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
