class MoviesModel {
  Dates? dates;
  dynamic page;
  List<MoviesResults>? results;
  dynamic totalPages;
  dynamic totalResults;

  MoviesModel(
      {this.dates,
      this.page,
      this.results,
      this.totalPages,
      this.totalResults});

  MoviesModel.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null ? new Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results!.add(new MoviesResults.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class Dates {
  dynamic maximum;
  dynamic minimum;

  Dates({this.maximum, this.minimum});

  Dates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }
}

class MoviesResults {
  bool? adult;
  dynamic backdropPath;
  List<dynamic>? genreIds;
  dynamic id;
  dynamic originalLanguage;
  dynamic originalTitle;
  dynamic overview;
  dynamic popularity;
  dynamic posterPath;
  dynamic releaseDate;
  dynamic title;
  dynamic video;
  dynamic voteAverage;
  dynamic voteCount;

  MoviesResults(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  MoviesResults.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}
