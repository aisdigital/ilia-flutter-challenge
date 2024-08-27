class MovieModel {
  int id;
  List<int> genreIds;
  String originalLanguage;
  String originalTitle;
  String title;
  String overview;
  String releaseDate;
  String posterPath;
  bool video;
  double popularity;
  double voteAverage;
  int voteCount;

  MovieModel({
    required this.id,
    required this.genreIds,
    required this.originalLanguage,
    required this.originalTitle,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.posterPath,
    required this.video,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
  });

  MovieModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      genreIds = json['genre_ids'],
      originalLanguage = json['original_language'],
      originalTitle = json['original_title'],
      title = json['title'],
      overview = json['overview'],
      releaseDate = json['release_date'],
      posterPath = json['poster_path'],
      video = json['video'],
      popularity = json['popularity'],
      voteAverage = json['vote_average'],
      voteCount = json['vote_count'];

}