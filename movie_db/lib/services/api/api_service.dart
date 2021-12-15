import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_db/domain/interfaces/i_api_service.dart';
import 'package:movie_db/domain/movie/movie.dart';
import 'package:movie_db/services/api/constants.dart';

@LazySingleton(as: IApiService)
class ApiService implements IApiService {
  final Dio _dio = Dio();

  final initialUrl = ApiConstants.initialUrl;
  final apiKey = ApiConstants.apiKey;

  @override
  Future<List<Movie>> getNowPlayingOnPage(int page) async {
    try {
      final url =
          '$initialUrl/movie/now_playing?api_key=$apiKey&language=pt-BR&page=$page';
      final response = await _dio.get(url);
      var moviesData = response.data['results'] as List;
      List<Movie> movieList =
          moviesData.map((movie) => Movie.fromJson(movie)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  @override
  Future<Movie> getMovieRunTime(Movie movie) async {
    try {
      final url =
          '$initialUrl/movie/${movie.id}?api_key=$apiKey&language=pt-BR';
      final response = await _dio.get(url);
      return movie.copyWith(runTime: response.data['runtime'].toString());
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  @override
  Future<Movie> getMovieCast(Movie movie) async {
    try {
      final url =
          '$initialUrl/movie/${movie.id}/credits?api_key=$apiKey&language=pt-BR';
      final List<String?> castList = [];
      final response = await _dio.get(url);
      final castDetailList = response.data['cast'] as List;
      for (var details in castDetailList) {
        final name = details['name'];
        castList.add(name);
      }
      return movie.copyWith(cast: castList);
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  @override
  Future<String> getTrailerVideoKey(int id) async {
    try {
      final response =
          await _dio.get('$initialUrl/movie/$id/videos?api_key=$apiKey');
      var key = response.data['results'][0]['key'];
      return key;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  @override
  Future<List<Movie>> searchMovie(String query, int page) async {
    try {
      final url =
          '$initialUrl/search/movie?api_key=$apiKey&query=$query&language=pt-BR&page=$page&include_adult=false';
      final response = await _dio.get(url);
      var moviesData = response.data['results'] as List;
      List<Movie> movieList =
          moviesData.map((movie) => Movie.fromJson(movie)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
}
