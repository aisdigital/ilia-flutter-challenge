import 'package:pixel_cinema/app/modules/home/data/datasources/movies_datasource.dart';

abstract class MoviesRepository {
  Future<Map<String, dynamic>> fetchPage(int pageNumber);
  Future<Map<String, dynamic>> fetchVideo(String movieId);
  Future<Map<String, dynamic>> searchMovies(String query);
}

class MoviesRepositoryImpl implements MoviesRepository {
  MoviesRepositoryImpl({required this.datasource});

  final MoviesDatasource datasource;

  @override
  Future<Map<String, dynamic>> fetchPage(int pageNumber) async {
    final pageObject = await datasource.fetchPage(pageNumber);

    return pageObject;
  }

  @override
  Future<Map<String, dynamic>> fetchVideo(String movieId) async {
    final videosObject = await datasource.fetchVideos(movieId);

    return videosObject;
  }

  @override
  Future<Map<String, dynamic>> searchMovies(String query) async {
    final pageObject = await datasource.searchMovies(query);

    return pageObject;
  }
}
