import 'package:movie_db/domain/movie/movie.dart';

abstract class IApiService {
  Future<List<Movie>> getNowPlayingOnPage(int page);
  Future<String> getTrailerVideoKey(int id);
  Future<Movie> getMovieRunTime(Movie movie);
  Future<Movie> getMovieCast(Movie movie);
  Future<List<Movie>> searchMovie(String query, int page);
}
