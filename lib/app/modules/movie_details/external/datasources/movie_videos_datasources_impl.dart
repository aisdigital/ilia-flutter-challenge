import 'dart:convert';

import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/entities/movie_videos.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/external/mappers/movie_videos_mapper.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/infra/datasources/movie_videos_datasource.dart';
import 'package:ilia_flutter_challenge/utils/app_credentials.dart';
import 'package:http/http.dart' as http;

class MovieVideosDatasourceImpl implements MovieVideosDatasource {
  @override
  Future<MovieVideos> fetchAllMovieVideos(int id) async {
    final AppCredentials credentials = AppCredentials();
    final Uri url = Uri.https(
      'api.themoviedb.org',
      '/3/movie/$id/videos',
      {
        'language': 'pt-BR',
        'api_key': credentials.apiKey,
      },
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return MovieVideosMapper().movieVideosFromJson(jsonResponse);
      } else {
        throw Exception('Failed to load the movie videos!');
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
