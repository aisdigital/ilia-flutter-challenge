import 'package:ilia_flutter_challenge/app/core/failures/general_failure.dart';
import 'package:ilia_flutter_challenge/app/modules/home/domain/entities/now_playing_movies_search_result.dart';
import 'package:ilia_flutter_challenge/app/modules/home/domain/repositories/now_playing_movies_repository.dart';
import 'package:ilia_flutter_challenge/app/modules/home/domain/usecases/fetch_now_playing_movies_usecase.dart';
import 'package:result_dart/result_dart.dart';

class FetchNowPlayingMoviesUsecaseImpl implements FetchNowPlayingMoviesUsecase {
  FetchNowPlayingMoviesUsecaseImpl({required this.repository});

  final NowPlayingMoviesRepository repository;

  @override
  Future<Result<NowPlayingMoviesSearchResult, GeneralFailure>> call(
      String pageNumber) async {
    final response = await repository.fetchNowPlayingMovies(pageNumber);
    return response;
  }
}
