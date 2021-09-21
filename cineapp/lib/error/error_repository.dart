import 'package:cineapp/error/movie_error.dart';

class MovieErrorRepository extends MovieError {
  MovieErrorRepository(String message) {
    this.message = message;
  }
}
