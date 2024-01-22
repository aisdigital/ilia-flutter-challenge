import 'package:ilia_flutter_challenge/app/core/failures/general_failure.dart';
import 'package:ilia_flutter_challenge/app/modules/home/domain/entities/now_playing_movies_search_result.dart';
import 'package:result_dart/result_dart.dart';

abstract class FetchNowPlayingMoviesUsecase {
  Future<Result<NowPlayingMoviesSearchResult, GeneralFailure>> call(
      String pageNumber);
}
