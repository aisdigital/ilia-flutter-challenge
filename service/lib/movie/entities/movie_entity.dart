import 'package:service/movie/entities/genre_entity.dart';
import 'package:service/movie/entities/production_company_entity.dart';
import 'package:service/movie/entities/spoken_language_entity.dart';

class MovieEntity {
  final bool adult;
  final String? backdropPath;
  final dynamic belongsToCollection;
  final List<GenreEntity>? genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final List<String>? originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCompanyEntity>? productionCompanies;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final String? status;
  final String? tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final List<SpokenLanguageEntity>? spokenLanguages;

  MovieEntity({
    this.homepage,
    this.backdropPath,
    this.belongsToCollection,
    this.imdbId,
    this.posterPath,
    this.genres,
    this.originCountry,
    this.productionCompanies,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.spokenLanguages,
    this.releaseDate,
    required this.adult,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
}
