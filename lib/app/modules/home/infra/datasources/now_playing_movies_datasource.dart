import 'package:ilia_flutter_challenge/app/modules/home/domain/entities/now_playing_movies_search_result.dart';

abstract class NowPlayingMoviesDatasource {
  Future<NowPlayingMoviesSearchResult> fetchNowPlayingOnTheatresMovies(
      String pageNumber);
}
