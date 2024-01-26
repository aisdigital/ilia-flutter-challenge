import 'package:ilia_challenge/core/domain/interfaces/int_error.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_http_service.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_response.dart';
import 'package:ilia_challenge/main.dart';

class HomeRepository {
  final IntHttpService client = injector.find<IntHttpService>();

  Future<(IntError?, IntResponse?)> fetchMovies() async {
    final (IntError? error, IntResponse? response) =
        await client.get(route: '/3/movie/11');
    return (error, response);
  }
}
