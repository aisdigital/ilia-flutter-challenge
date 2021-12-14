import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_db/domain/interfaces/i_api_service.dart';
import 'package:movie_db/domain/movie/movie.dart';

@LazySingleton(as: IApiService)
class ApiService implements IApiService {
  //TODO: passar como uma interface
  final Dio _dio = Dio();

  //TODO: reservar em constantes
  final initialUrl = 'https://api.themoviedb.org/3';
  final apiKey = '32183061a4649baa342364978166fe69';

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
}
