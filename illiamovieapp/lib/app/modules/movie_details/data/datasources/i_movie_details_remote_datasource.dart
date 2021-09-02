import '../models/movie_details_model.dart';
import '../models/movie_similar_model.dart';
import '../models/movie_video_model.dart';

abstract class IMovieDetailsRemoteDatasource {
  Future<MovieDetailsModel> getMovieDetails({
    required String movieId,
  });
  Future<List<MovieVideoModel>> getMovieVideo({
    required String movieId,
  });
  Future<List<MovieSimilarModel>> getMoviesSimilar({
    required String movieId,
  });
}
