import 'package:dio/dio.dart';
import 'package:ilia_flutter_challenge/repositories/now_playing_movies_repository.dart';
import 'package:ilia_flutter_challenge/service/dio_service.dart';
import 'package:ilia_flutter_challenge/shared/utils/api_exception.dart';
import 'package:ilia_flutter_challenge/shared/utils/api_utils.dart';

class NowPlayingMoviesRepositoryImp implements NowPlayingMoviesRepository {
  final DioService dioService;

  NowPlayingMoviesRepositoryImp(this.dioService);
  @override
  Future fetchByPage(int? page) async {
    try {
      var response =
          await dioService.MovieApiDio().get(ApiUtils.NOW_PLAYING(page ?? 1));
      if (response.statusCode == 200) {
        return response;
      } else {
        throw DioException(requestOptions: RequestOptions());
      }
    } on DioException catch (e) {
      String error = ApiExeption.getExeptionMessage(e);
      return error;
    }
  }
}
