import 'package:core/client/http_client.dart';
import 'package:core/client/http_response.dart';
import 'package:core/client/request_data.dart';
import 'package:core/constant/env.dart';
import 'package:core/core.dart';
import 'package:core/error/base_exception.dart';
import 'package:core/error/default_exception.dart';
import 'package:core/type/output.dart';
import 'package:service/movie/adapter/movie_adapter.dart';
import 'package:service/movie/entities/movie_entity.dart';
import 'package:service/movie/repository/remote/search/search_repository.dart';

class MovieSearchRepositoryImpl implements MovieSearchRepository {
  final client = GetIt.instance<HttpClient>();

  @override
  Future<Output<List<MovieEntity>>> fetch({required String query, required int page}) async {
    try {
      final HttpResponse<dynamic> response = await client.request(
        HttpRequestData(
          baseUrl: apiBaseUrl,
          endpoint: '/search/movie?query=$query&include_adult=false&language=en-US&page=$page&api_key=$apiKey',
          method: HttpMethod.get,
        ),
      );

      if (response.data['success'] == false) return Left(DefaultException(message: response.data['status_message']));

      final List<MovieEntity> movies = [];
      if (response.data['results'] != null) {
        response.data['results'].forEach(
          (dynamic result) {
            movies.add(MovieAdapter.fromJson(result as Map<String, dynamic>));
          },
        );
      }

      return Right(movies);
    } on BaseException catch (err) {
      return Left(DefaultException(message: err.message, statusCode: err.statusCode));
    } catch (_) {
      return const Left(DefaultException(message: 'Unknown error'));
    }
  }
}
