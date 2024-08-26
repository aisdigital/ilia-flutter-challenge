import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_catalog/core/common/entities/genre.dart';
import 'package:movie_catalog/core/constants/constants.dart';
import 'package:movie_catalog/features/movie_details/data/models/movie_details_model.dart';
import 'package:movie_catalog/features/movie_details/data/models/movie_videos_response_model.dart';
import 'package:movie_catalog/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_catalog/features/movie_details/domain/entities/movie_videos_response.dart';
import 'package:movie_catalog/features/movies_list/data/models/genre_response_model.dart';
import 'package:movie_catalog/features/movies_list/data/models/models.dart';
import 'package:movie_catalog/features/movies_list/domain/entities/theater_movies_response.dart';

enum CallPath {
  theaterMovies('/movie/now_playing'),
  genres('/genre/movie/list'),
  movieDetail('/movie'),
  movieVideos('/videos');

  final String path;

  const CallPath(this.path);
}

class DioClient {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: apiBaseUrl,
      queryParameters: {
        'api_key': dotenv.env['API_KEY'],
        'language': 'pt-BR',
        'region': 'br',
      },
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<TheaterMoviesResponse> getTheaterMovies(int page) async {
    try {
      dio.options.queryParameters.addEntries([MapEntry('page', page)]);
      final response = await dio.get(CallPath.theaterMovies.path);
      final theaterMovies = TheaterMoviesResponseModel.fromJson(response.data);
      dio.options.queryParameters.remove('page');

      return theaterMovies;
    } on DioException {
      rethrow;
    }
  }

  Future<MovieDetails> getMovieDetails(int id) async {
    try {
      final response = await dio.get('${CallPath.movieDetail.path}/$id');
      final movieDetails = MovieDetailsModel.fromJson(response.data);

      return movieDetails;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<MovieVideosResponse> getMovieVideos(int id) async {
    try {
      final response = await dio.get('/movie/$id${CallPath.movieVideos.path}');
      final movieVideos = MovieVideosResponseModel.fromJson(response.data);

      return movieVideos;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<Genre>> getGenres() async {
    try {
      final response = await dio.get(CallPath.genres.path);
      final genresResponse = GenreResponseModel.fromJson(response.data);

      return genresResponse.genres;
    } on DioException catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
