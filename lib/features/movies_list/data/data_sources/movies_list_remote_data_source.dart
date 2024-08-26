import 'package:movie_catalog/core/network/dio_client.dart';
import 'package:movie_catalog/features/movies_list/domain/entities/theater_movies_response.dart';

abstract interface class MoviesListRemoteDataSource {
  Future<TheaterMoviesResponse> getMovies(int page);
}

class MoviesListRemoteDataSourceImpl implements MoviesListRemoteDataSource {
  final DioClient dio = DioClient();

  @override
  Future<TheaterMoviesResponse> getMovies(int page) async {
    try {
      return await dio.getTheaterMovies(page);
    } catch (_) {
      rethrow;
    }
  }
}
