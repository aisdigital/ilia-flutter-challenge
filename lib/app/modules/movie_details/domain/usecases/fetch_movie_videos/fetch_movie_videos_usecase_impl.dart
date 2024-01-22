import 'package:ilia_flutter_challenge/app/core/failures/general_failure.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/entities/movie_videos.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/repositories/movie_videos_repository.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/usecases/fetch_movie_videos/fetch_movie_videos_usecase.dart';
import 'package:result_dart/result_dart.dart';

class FetchMovieVideosUsecaseImpl implements FetchMovieVideosUsecase {
  FetchMovieVideosUsecaseImpl({required this.repository});

  final MovieVideosRepository repository;

  @override
  Future<Result<MovieVideos, GeneralFailure>> call(int id) async {
    final response = await repository.fetchMovieVideos(id);
    return response;
  }
}
