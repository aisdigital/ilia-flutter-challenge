import 'package:ilia_flutter_challenge/app/core/failures/general_failure.dart';
import 'package:ilia_flutter_challenge/app/modules/home/domain/entities/now_playing_movies_search_result.dart';
import 'package:ilia_flutter_challenge/app/modules/home/domain/repositories/now_playing_movies_repository.dart';
import 'package:ilia_flutter_challenge/app/modules/home/infra/datasources/now_playing_movies_datasource.dart';
import 'package:result_dart/result_dart.dart';

class NowPlayingMoviesRepositoryImpl implements NowPlayingMoviesRepository {
  NowPlayingMoviesRepositoryImpl({required this.datasource});

  final NowPlayingMoviesDatasource datasource;

  @override
  Future<Result<NowPlayingMoviesSearchResult, GeneralFailure>>
      fetchNowPlayingMovies(String pageNumber) async {
    try {
      final response =
          await datasource.fetchNowPlayingOnTheatresMovies(pageNumber);
      return Success(response);
    } on GeneralFailure catch (error) {
      return Failure(error);
    }
  }
}
