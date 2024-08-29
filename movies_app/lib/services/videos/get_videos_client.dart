import 'package:movies_app/models/videos_request_model.dart';
import '../../models/api_result_model.dart';

abstract class IGetVideosClient {
  Future<ApiResult<VideosRequestModel>> requestVideos(String idMovie);
}
