import 'package:movie_catalog/features/movies_list/domain/entities/dates.dart';
import 'package:movie_catalog/features/movies_list/domain/entities/movie.dart';

class TheaterMoviesResponse {
  final Dates dates;
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  const TheaterMoviesResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
