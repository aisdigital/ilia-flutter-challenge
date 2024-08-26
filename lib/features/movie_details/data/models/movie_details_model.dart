import 'package:movie_catalog/core/common/entities/genre.dart';
import 'package:movie_catalog/features/movies_list/data/models/genre_model.dart';
import 'package:movie_catalog/features/movie_details/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  MovieDetailsModel({
    required super.overview,
    required super.title,
    required super.runtime,
    required super.voteAverage,
    super.adult,
    super.budget,
    super.genres,
    super.id,
    super.imdbId,
    super.popularity,
    super.posterPath,
    super.backdropPath,
    super.releaseDate,
    super.status,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      overview: json['overview'],
      title: json['title'],
      runtime: json['runtime'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      adult: json['adult'],
      budget: json['budget'],
      genres: (json['genres'] as List<dynamic>?)?.map((e) => GenreModel.fromJson(e as Map<String, dynamic>)).toList(),
      id: json['id'],
      imdbId: json['imdb_id'],
      popularity: (json['popularity'] as num?)?.toDouble(),
      releaseDate: json['release_date'],
      status: json['status'],
    );
  }

  MovieDetails copyWith({
    String? overview,
    String? title,
    int? runtime,
    double? voteAverage,
    String? posterPath,
    String? backdropPath,
    bool? adult,
    int? budget,
    List<Genre>? genres,
    int? id,
    String? imdbId,
    double? popularity,
    String? releaseDate,
    String? status,
  }) {
    return MovieDetails(
      overview: overview ?? this.overview,
      title: title ?? this.title,
      runtime: runtime ?? this.runtime,
      voteAverage: voteAverage ?? this.voteAverage,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      adult: adult ?? this.adult,
      budget: budget ?? this.budget,
      genres: genres ?? this.genres,
      id: id ?? this.id,
      imdbId: imdbId ?? this.imdbId,
      popularity: popularity ?? this.popularity,
      releaseDate: releaseDate ?? this.releaseDate,
      status: status ?? this.status,
    );
  }
}
