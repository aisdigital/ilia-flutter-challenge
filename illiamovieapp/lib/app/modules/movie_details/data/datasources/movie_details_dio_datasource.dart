import 'package:dio/dio.dart';

import '../../../../core/const/api_const.dart';
import '../../../../core/error/exceptions.dart';
import '../models/movie_details_model.dart';
import '../models/movie_similar_model.dart';
import '../models/movie_video_model.dart';
import 'i_movie_details_remote_datasource.dart';

class MovieDetailsDioDatasource implements IMovieDetailsRemoteDatasource {
  final Dio _client;

  MovieDetailsDioDatasource({required Dio client}) : _client = client;

  @override
  Future<MovieDetailsModel> getMovieDetails({required String movieId}) async {
    const String failureMessage =
        'Não foi possível buscar os detalhes do filme';
    try {
      final response = await _client.get(
        ApiConst.movieDetails(movieId),
      );

      if (response.statusCode == 200) {
        final responseBody = response.data;

        return MovieDetailsModel.fromMap(responseBody);
      }

      throw ServerException();
    } catch (e) {
      throw ServerException(message: failureMessage);
    }
  }

  @override
  Future<List<MovieVideoModel>> getMovieVideo({required String movieId}) async {
    const String failureMessage = 'Não foi possível buscar o video';
    try {
      final response = await _client.get(
        ApiConst.movieVideos(movieId),
      );

      if (response.statusCode == 200) {
        final responseBody = response.data['results'];

        return List<MovieVideoModel>.generate(
          responseBody.length,
          (index) => MovieVideoModel.fromMap(
            responseBody[index],
          ),
        );
      }

      throw ServerException();
    } catch (e) {
      throw ServerException(message: failureMessage);
    }
  }

  @override
  Future<List<MovieSimilarModel>> getMoviesSimilar(
      {required String movieId}) async {
    const String failureMessage = 'Não foi possível buscar os filmes em teatro';
    try {
      final response = await _client.get(
        ApiConst.similarMovies(movieId),
      );

      if (response.statusCode == 200) {
        final responseBody = response.data['results'];

        return List.generate(
          responseBody.length,
          (index) => MovieSimilarModel.fromMap(
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
