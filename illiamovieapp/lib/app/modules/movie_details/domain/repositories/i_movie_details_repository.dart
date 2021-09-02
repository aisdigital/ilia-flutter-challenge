import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/movie_details_entity.dart';
import '../entities/movie_similar_entity.dart';
import '../entities/movie_video_entity.dart';

abstract class IMovieDetailsRepository {
  Future<Either<IFailure, MovieDetails>> getMovieDetails({
    required String movieId,
  });
  Future<Either<IFailure, List<MovieVideo>>> getMovieVideo({
    required String movieId,
  });
  Future<Either<IFailure, List<MovieSimilar>>> getMoviesSimilar({
    required String movieId,
  });
}
