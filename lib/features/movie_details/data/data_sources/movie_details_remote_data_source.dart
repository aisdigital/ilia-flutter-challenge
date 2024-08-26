import 'package:movie_catalog/core/network/dio_client.dart';
import 'package:movie_catalog/features/movie_details/domain/entities/movie_details.dart';

abstract interface class MovieDetailsRemoteDataSource {
  Future<MovieDetails> getMovieDetails(int id);
}

class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  final DioClient dio = DioClient();

  @override
  Future<MovieDetails> getMovieDetails(int id) async {
    try {
      return await dio.getMovieDetails(id);
    } catch (_) {
      rethrow;
    }
  }
}
