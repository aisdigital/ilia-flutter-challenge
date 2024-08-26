import 'package:movie_catalog/core/common/entities/genre.dart';
import 'package:movie_catalog/core/network/dio_client.dart';

abstract interface class GenreRemoteDataSource {
  Future<List<Genre>> getGenres();
}

class GenreRemoteDataSourceImpl implements GenreRemoteDataSource {
  final DioClient dio = DioClient();

  @override
  Future<List<Genre>> getGenres() async {
    try {
      return await dio.getGenres();
    } catch (_) {
      rethrow;
    }
  }
}
