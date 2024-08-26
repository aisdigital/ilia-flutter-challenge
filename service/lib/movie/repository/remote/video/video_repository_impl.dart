import 'package:core/client/http_client.dart';
import 'package:core/client/http_response.dart';
import 'package:core/client/request_data.dart';
import 'package:core/constant/env.dart';
import 'package:core/core.dart';
import 'package:core/error/base_exception.dart';
import 'package:core/error/default_exception.dart';
import 'package:core/type/output.dart';
import 'package:service/movie/adapter/video_adapter.dart';
import 'package:service/movie/entities/video_entity.dart';
import 'package:service/movie/repository/remote/video/video_repository.dart';

class MovieVideoRepositoryImpl implements MovieVideoRepository {
  final client = GetIt.instance<HttpClient>();

  @override
  Future<Output<List<VideoEntity>>> fetch({required int id}) async {
    try {
      final HttpResponse<dynamic> response = await client.request(
        HttpRequestData(
          baseUrl: apiBaseUrl,
          endpoint: '/movie/$id/videos?language=en-US&api_key=$apiKey',
          method: HttpMethod.get,
        ),
      );

      if (response.data['success'] == false) return Left(DefaultException(message: response.data['status_message']));

      final List<VideoEntity> videos = [];
      if (response.data['results'] != null) {
        response.data['results'].forEach(
          (dynamic result) {
            videos.add(VideoAdapter.fromJson(result as Map<String, dynamic>));
          },
        );
      }

      return Right(videos);
    } on BaseException catch (err) {
      return Left(DefaultException(message: err.message, statusCode: err.statusCode));
    } catch (_) {
      return const Left(DefaultException(message: 'Unknown error'));
    }
  }
}
