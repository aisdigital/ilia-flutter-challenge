import 'package:movie_catalog/core/common/entities/genre.dart';

class MovieDetails {
  final String overview;
  final String title;
  final int runtime;
  final double voteAverage;
  final String? posterPath;
  final String? backdropPath;
  final bool? adult;
  final int? budget;
  final List<Genre>? genres;
  final int? id;
  final String? imdbId;
  final double? popularity;
  final String? releaseDate;
  final String? status;

  const MovieDetails({
    required this.overview,
    required this.title,
    required this.runtime,
    required this.voteAverage,
    this.adult,
    this.budget,
    this.genres,
    this.id,
    this.imdbId,
    this.popularity,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.status,
  });
}
