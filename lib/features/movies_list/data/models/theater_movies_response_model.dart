import 'package:movie_catalog/features/movies_list/domain/entities/theater_movies_response.dart';

import 'models.dart';

class TheaterMoviesResponseModel extends TheaterMoviesResponse {
  const TheaterMoviesResponseModel({
    required super.dates,
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory TheaterMoviesResponseModel.fromJson(Map<String, dynamic> json) => TheaterMoviesResponseModel(
        dates: DatesModel.fromJson(json['dates'] as Map<String, dynamic>),
        page: json['page'] as int,
        results: (json['results'] as List<dynamic>).map((movie) => MovieModel.fromJson(movie)).toList(),
        totalPages: json['total_pages'] as int,
        totalResults: json['total_results'] as int,
      );

  TheaterMoviesResponseModel copyWith({
    DatesModel? dates,
    int? page,
    List<MovieModel>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return TheaterMoviesResponseModel(
      dates: dates ?? this.dates,
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}
