import 'package:ilia_flutter_challenge/app/core/failures/general_failure.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/entities/movie_videos.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/repositories/movie_videos_repository.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/infra/datasources/movie_videos_datasource.dart';
import 'package:result_dart/result_dart.dart';

class MovieVideosRepositoryImpl implements MovieVideosRepository {
  MovieVideosRepositoryImpl({required this.datasource});

  final MovieVideosDatasource datasource;

  @override
  Future<Result<MovieVideos, GeneralFailure>> fetchMovieVideos(int id) async {
    try {
      final response = await datasource.fetchAllMovieVideos(id);
      return Success(response);
    } on GeneralFailure catch (error) {
      return Failure(error);
    }
  }
}
