import 'package:service/movie/adapter/genre_adapter.dart';
import 'package:service/movie/adapter/production_company_adapter.dart';
import 'package:service/movie/adapter/spoken_language_adapter.dart';
import 'package:service/movie/entities/movie_entity.dart';

class MovieAdapter {
  static MovieEntity fromJson(Map<String, dynamic> json) {
    return MovieEntity(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      status: json['status'],
      tagline: json['tagline'],
      homepage: json['homepage'],
      imdbId: json['imdb_id'],
      spokenLanguages: json['spoken_languages'] != null
          ? (json['spoken_languages'] as List).map((e) => SpokenLanguageAdapter.fromJson(e)).toList()
          : null,
      genres: json['genres'] != null ? (json['genres'] as List).map((e) => GenreAdapter.fromJson(e)).toList() : null,
      productionCompanies: json['production_companies'] != null
          ? (json['production_companies'] as List).map((e) => ProductionCompanyAdapter.fromJson(e)).toList()
          : null,
    );
  }

  static Map<String, dynamic> toJson({required MovieEntity entity}) {
    return {
      'adult': entity.adult,
      'backdrop_path': entity.backdropPath,
      'id': entity.id,
      'original_language': entity.originalLanguage,
      'original_title': entity.originalTitle,
      'overview': entity.overview,
      'popularity': entity.popularity,
      'poster_path': entity.posterPath,
      'release_date': entity.releaseDate,
      'title': entity.title,
      'video': entity.video,
      'vote_average': entity.voteAverage,
      'vote_count': entity.voteCount,
    };
  }
}
