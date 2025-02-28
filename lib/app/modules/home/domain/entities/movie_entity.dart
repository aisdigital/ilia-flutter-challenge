class MovieEntity {
  MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    this.trailerKey,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) => MovieEntity(
        id: json['id'].toString(),
        title: json['title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'].isEmpty ? null : DateTime.parse(json['release_date']),
      );

  final String id;
  final String title;
  final String overview;
  final String? posterPath;
  final DateTime? releaseDate;
  String? trailerKey;
}
