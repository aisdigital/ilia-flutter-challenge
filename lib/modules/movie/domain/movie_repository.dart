import 'package:ilia_challenge/core/domain/interfaces/int_http_service.dart';
import 'package:ilia_challenge/main.dart';

class MovieRepository {
  final IntHttpService client = injector.find<IntHttpService>();

  fetchMovies() async {
    return await client.get(route: 'https://api.themoviedb.org/3/movie/11');
  }
}
