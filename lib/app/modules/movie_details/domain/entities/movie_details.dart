class MovieDetails {
  final bool? adult;
  final String? backdropPath;
  final Map<String, dynamic>? belongsToCollection;
  final int? budget;
  final List<dynamic>? genres;
  final String? homePage;
  final int? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<dynamic>? productionCompanies;
  final List<dynamic>? productionCountries;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<dynamic>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MovieDetails({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homePage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  const MovieDetails.empty()
      : adult = false,
        backdropPath = '',
        belongsToCollection = const {},
        budget = 0,
        genres = const [],
        homePage = '',
        id = 0,
        imdbId = '',
        originalLanguage = '',
        originalTitle = '',
        overview = '',
        popularity = 0.0,
        posterPath = '',
        productionCompanies = const [],
        productionCountries = const [],
        releaseDate = '',
        revenue = 0,
        runtime = 0,
        spokenLanguages = const [],
        status = '',
        tagline = '',
        title = '',
        video = false,
        voteAverage = 0.0,
        voteCount = 0;
}
