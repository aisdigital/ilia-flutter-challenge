import 'package:movie_catalog/core/network/dio_client.dart';
import 'package:movie_catalog/features/movie_details/domain/entities/movie_videos_response.dart';

abstract interface class MovieVideosResponseRemoteDataSource {
  Future<MovieVideosResponse> getMovieVideos(int id);
}

class MovieVideosResponseRemoteDataSourceImpl implements MovieVideosResponseRemoteDataSource {
  final DioClient dio = DioClient();

  @override
  Future<MovieVideosResponse> getMovieVideos(int id) async {
    try {
      return await dio.getMovieVideos(id);
    } catch (_) {
      rethrow;
    }
  }
}
