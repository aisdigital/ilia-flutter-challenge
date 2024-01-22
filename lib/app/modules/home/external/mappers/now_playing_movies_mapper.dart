import 'package:ilia_flutter_challenge/app/modules/home/domain/entities/now_playing_movies_search_result.dart';

class NowPlayingMoviesMapper {
  Map<String, dynamic> nowPlayingMoviesToJson(
      NowPlayingMoviesSearchResult entity) {
    return {
      'dates': entity.dates,
      'page': entity.page,
      'results': entity.results,
      'total_pages': entity.totalPages,
      'total_results': entity.totalResults,
    };
  }

  NowPlayingMoviesSearchResult nowPlayingMoviesFromJson(
          Map<String, dynamic> json) =>
      NowPlayingMoviesSearchResult(
        dates: json["dates"],
        page: json["page"],
        results: json["results"],
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
