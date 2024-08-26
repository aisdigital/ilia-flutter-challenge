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
import 'package:service/movie/repository/remote/details/details_repository.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final client = GetIt.instance<HttpClient>();

  @override
  Future<Output<MovieEntity>> fetch({required int id}) async {
    try {
      final HttpResponse<dynamic> response = await client.request(
        HttpRequestData(
          baseUrl: apiBaseUrl,
          endpoint: '/movie/$id?language=en-US&api_key=$apiKey',
          method: HttpMethod.get,
          headers: {'Authorization': 'Bearer $apiKey'},
        ),
      );

      if (response.data['success'] == false) return Left(DefaultException(message: response.data['status_message']));

      MovieEntity? movie;

      if (response.data != null) movie = MovieAdapter.fromJson(response.data as Map<String, dynamic>);

      if (movie == null) return Left(DefaultException(message: 'Movie not found'));

      return Right(movie);
    } on BaseException catch (err) {
      return Left(DefaultException(message: err.message, statusCode: err.statusCode));
    } catch (_) {
      return const Left(DefaultException(message: 'Unknown error'));
    }
  }
}
