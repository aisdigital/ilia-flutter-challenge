import '../../models/api_result_model.dart';
import '../../models/movie_request_model.dart';

abstract class IGetMoviesClient {
  Future<ApiResult<MovieRequestModel>> requestMovies();
}
