import 'package:movie_db/domain/movie/movie.dart';

abstract class IApiService {
  Future<List<Movie>> getNowPlaying();
}
