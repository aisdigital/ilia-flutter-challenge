class Movie {
  final String? backdropPath;
  final int? id;
  final String? originalLanguage;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final String? voteAverage;
  final String? runTime;
  final List<String?>? cast;

  String? error;

  Movie({
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.runTime,
    this.cast,
  });

  factory Movie.fromJson(dynamic json) {
    if (json == null) {
      return Movie();
    }

    return Movie(
        backdropPath: json['backdrop_path'],
        id: json['id'],
        originalLanguage: json['original_language'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'].toString(),
        runTime: json['runtime'],
        cast: json['cast']);
  }
  Movie copyWith({
    String? backdropPath,
    int? id,
    String? originalLanguage,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    String? voteAverage,
    String? runTime,
    List<String?>? cast,
  }) =>
      Movie(
        backdropPath: backdropPath ?? this.backdropPath,
        id: id ?? this.id,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        releaseDate: releaseDate ?? this.releaseDate,
        title: title ?? this.title,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        runTime: runTime ?? this.runTime,
        cast: cast ?? this.cast,
      );
}
