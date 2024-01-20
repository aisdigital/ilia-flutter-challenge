import 'dart:convert';

import 'package:ilia_flutter_challenge/app/modules/home/domain/entities/now_playing_movies_search_result.dart';
import 'package:ilia_flutter_challenge/app/modules/home/external/mappers/now_playing_movies_mapper.dart';
import 'package:ilia_flutter_challenge/app/modules/home/infra/datasources/now_playing_movies_datasource.dart';
import 'package:ilia_flutter_challenge/utils/app_credentials.dart';
import 'package:http/http.dart' as http;

class NowPlayingMoviesDatasourceImpl implements NowPlayingMoviesDatasource {
  @override
  Future<NowPlayingMoviesSearchResult> fetchNowPlayingOnTheatresMovies(
      String pageNumber) async {
    final AppCredentials credentials = AppCredentials();
    final Uri url = Uri.https(
      'api.themoviedb.org',
      '/3/movie/now_playing',
      {
        'language': 'pt-BR',
        'page': pageNumber,
        'api_key': credentials.apiKey,
      },
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return NowPlayingMoviesMapper().nowPlayingMoviesFromJson(jsonResponse);
      } else {
        throw Exception('Failed to load the now playing movies on theatres!');
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
