import 'package:fpdart/fpdart.dart';
import 'package:movie_catalog/core/error/failure.dart';
import 'package:movie_catalog/features/movie_details/domain/entities/movie_videos_response.dart';

abstract interface class MovieVideosResponseRepository {
  Future<Either<Failure, MovieVideosResponse>> getMovieVideosResponse({
    required int id,
  });
}
