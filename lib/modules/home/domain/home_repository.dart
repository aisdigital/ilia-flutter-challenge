import 'package:ilia_challenge/modules/core/domain/services/http_handler_service.dart';

class HomeRepository {
  final HttpHandlerService client;

  HomeRepository({required this.client});

  fetchMovies() {
    return client.get(route: 'https://api.themoviedb.org/3/movie/11');
  }
}
