import 'package:movie_catalog/features/movies_list/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.genreIds,
    required super.adult,
    super.posterPath,
    super.overview,
    super.popularity,
    super.releaseDate,
    super.title,
    super.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'] as int,
        posterPath: json['poster_path'] != null ? (json['poster_path'] as String) : '',
        genreIds: List<int>.from(json['genre_ids']),
        adult: json['adult'] as bool,
        overview: json['overview'] as String?,
        popularity: json['popularity'] as double?,
        releaseDate: json['release_date'] as String?,
        title: json['title'] as String?,
        voteAverage: json['vote_average'] as double?,
      );

  MovieModel copyWith({
    int? id,
    String? posterPath,
    List<int>? genreIds,
    bool? adult,
    String? overview,
    double? popularity,
    String? releaseDate,
    String? title,
    double? voteAverage,
  }) {
    return MovieModel(
      id: id ?? this.id,
      posterPath: posterPath ?? this.posterPath,
      genreIds: genreIds ?? this.genreIds,
      adult: adult ?? this.adult,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      voteAverage: voteAverage ?? this.voteAverage,
    );
  }
}
