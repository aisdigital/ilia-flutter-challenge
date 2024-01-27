import 'package:ilia_challenge/core/domain/interfaces/int_error.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_http_service.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_response.dart';
import 'package:ilia_challenge/main.dart';

class HomeRepository {
  final IntHttpService client = injector.find<IntHttpService>();

  Future<(IntError?, IntResponse?)> loadMovies({required String route}) async {
    final (IntError? error, IntResponse? response) =
        await client.get(route: route);
    return (error, response);
  }

  Future<(IntError?, IntResponse?)> nowPlaying({required String route}) async {
    final (IntError? error, IntResponse? response) =
        await client.get(route: '/movie/now_playing?language=pt-BR&page=1');
    return (error, response);
  }

  Future<(IntError?, IntResponse?)> upcoming({required String route}) async {
    final (IntError? error, IntResponse? response) =
        await client.get(route: '/movie/upcoming?language=pt-BR&page=1');
    return (error, response);
  }

  Future<(IntError?, IntResponse?)> discover({required String route}) async {
    final (IntError? error, IntResponse? response) =
        await client.get(route: '/discover/movie?language=pt-BR&page=1');

    return (error, response);
  }

  Future<(IntError?, IntResponse?)> popular({required String route}) async {
    final (IntError? error, IntResponse? response) =
        await client.get(route: '/movie/popular?language=pt-BR&page=1');
    return (error, response);
  }
}
