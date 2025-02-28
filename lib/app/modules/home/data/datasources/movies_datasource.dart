import 'package:pixel_cinema/app/core/data/datasources/remote_datasource.dart';

abstract class MoviesDatasource {
  Future<Map<String, dynamic>> fetchPage(int pageNumber);
  Future<Map<String, dynamic>> fetchVideos(String movideId);
  Future<Map<String, dynamic>> searchMovies(String query);
}

class MoviesDatasourceImpl implements MoviesDatasource {
  MoviesDatasourceImpl({
    required this.remoteDatasource,
  });

  final RemoteDatasource remoteDatasource;
  final apiKey = const String.fromEnvironment('API_KEY');

  @override
  Future<Map<String, dynamic>> fetchPage(int pageNumber) async {
    final response = await remoteDatasource.get(
      url: "https://api.themoviedb.org/3/movie/now_playing",
      query: {
        'language': 'en-US',
        'page': pageNumber,
      },
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
    );
    return response;
  }

  @override
  Future<Map<String, dynamic>> fetchVideos(String movieId) async {
    final response = await remoteDatasource.get(
      url: 'https://api.themoviedb.org/3/movie/$movieId/videos',
      query: {'language': 'en-US'},
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
    );
    return response;
  }

  @override
  Future<Map<String, dynamic>> searchMovies(String query) async {
    final response = await remoteDatasource.get(
      url: "https://api.themoviedb.org/3/search/movie?=deadpool&&&",
      query: {
        'query': query,
        'include_adult': false,
        'language': 'en-US',
        'page': '1',
      },
      headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
    );
    return response;
  }
}
