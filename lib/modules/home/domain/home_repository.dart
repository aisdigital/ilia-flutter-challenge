import 'package:ilia_challenge/modules/core/domain/services/ilia_http_service.dart';

class HomeRepository {
  final IliaHttpService client;

  HomeRepository({required this.client});

  fetchMovies() {
    return client.get(route: 'https://api.themoviedb.org/3/movie/11');
  }
}
