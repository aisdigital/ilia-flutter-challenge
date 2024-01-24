class Movie {
  String? id;
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;
  int? total_Pages;
  int? page;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    this.id,
    this.page,
    this.total_Pages,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json["id"].toString(),
      title: json["title"],
      backDropPath: json["backdrop_path"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"].toDouble(),
      page: json["page"],
      total_Pages: json["total_pages"],
    );
  }
}
