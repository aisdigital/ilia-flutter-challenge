import 'dart:convert';

class Movie {
  final double? popularity;
  final int? voteCount;
  final bool? video;
  final String? posterPath;
  final int? id;
  final bool? adult;
  final String? backdropPath;
  final String? originalLanguage;
  final String? originalTitle;
  final List<int>? genreIds;
  final String title;
  final double? voteAverage;
  final String? overview;
  final DateTime? releaseDate;

  const Movie({
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.posterPath,
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.genreIds,
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
  });

  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],
        video: json["video"],
        posterPath: json["poster_path"],
        id: json["id"],
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        releaseDate: DateTime.tryParse(json["release_date"]),
      );
}
