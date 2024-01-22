import 'package:ilia_flutter_challenge/app/core/failures/general_failure.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/entities/movie_videos.dart';
import 'package:result_dart/result_dart.dart';

abstract class FetchMovieVideosUsecase {
  Future<Result<MovieVideos, GeneralFailure>> call(int id);
}
