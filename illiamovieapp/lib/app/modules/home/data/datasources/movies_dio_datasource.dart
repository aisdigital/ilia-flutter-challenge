import 'package:dio/dio.dart';

import '../../../../core/const/api_const.dart';
import '../../../../core/error/exceptions.dart';
import '../models/movie_model.dart';
import 'i_movies_remote_datasource.dart';

class MoviesDioDatasource implements IMoviesRemoteDatasource {
  final Dio _client;

  MoviesDioDatasource({required Dio client}) : _client = client;

  @override
  Future<List<MovieModel>> getMoviesInTheatre({
    required String language,
    required int page,
  }) async {
    const String failureMessage = 'Não foi possível buscar os filmes em teatro';
    try {
      final Map<String, dynamic> queryParams = <String, dynamic>{
        'language': language,
        'page': page
      };

      final response = await _client.get(
        ApiConst.moviesInTheatre,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        final responseBody = response.data['results'];

        return List.generate(
          responseBody.length,
          (index) => MovieModel.fromMap(
            responseBody[index],
          ),
        );
      }

      throw ServerException();
    } catch (e) {
      throw ServerException(message: failureMessage);
    }
  }
}
