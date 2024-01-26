
import 'package:ilia_challenge/core/domain/interfaces/int_error.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_http_service.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_response.dart';
import 'package:ilia_challenge/main.dart';

class MovieRepository {
  final IntHttpService client = injector.find<IntHttpService>();

  Future<(IntError?, IntResponse?)> movieDetails() async {
    final (IntError? error, IntResponse? response) =
        await client.get(route: '/discover/movie');
    return (error, response);
  }
}
