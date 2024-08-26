class Movie {
  final int id;
  final String? posterPath;
  final List<int> genreIds;
  final bool adult;
  final String? overview;
  final double? popularity;
  final String? releaseDate;
  final String? title;
  final double? voteAverage;

  const Movie({
    required this.id,
    required this.genreIds,
    required this.adult,
    this.posterPath,
    this.overview,
    this.popularity,
    this.releaseDate,
    this.title,
    this.voteAverage,
  });
}
