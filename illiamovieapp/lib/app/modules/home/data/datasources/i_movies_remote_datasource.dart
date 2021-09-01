import '../models/movie_model.dart';

abstract class IMoviesRemoteDatasource {
  Future<List<MovieModel>> getMoviesInTheatre({
    required String language,
    required int page,
  });
}
