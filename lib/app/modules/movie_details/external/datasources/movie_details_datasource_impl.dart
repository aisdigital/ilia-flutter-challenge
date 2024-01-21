import 'dart:convert';

import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/entities/movie_details.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/external/mappers/movie_details_mapper.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/infra/datasources/movie_details_datasource.dart';
import 'package:ilia_flutter_challenge/utils/app_credentials.dart';
import 'package:http/http.dart' as http;

class MovieDetailsDatasourceImpl implements MovieDetailsDatasource {
  @override
  Future<MovieDetails> fetchAllMovieDetails(int id) async {
    final AppCredentials credentials = AppCredentials();
    final Uri url = Uri.https(
      'api.themoviedb.org',
      '/3/movie/$id',
      {
        'language': 'pt-BR',
        'api_key': credentials.apiKey,
      },
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        return MovieDetailsMapper().movieDetailsFromJson(jsonResponse);
      } else {
        throw Exception('Failed to load the movie details!');
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
