import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/entities/movie_details.dart';

abstract class MovieDetailsDatasource {
  Future<MovieDetails> fetchAllMovieDetails(int id);
}
