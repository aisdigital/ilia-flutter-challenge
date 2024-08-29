import 'package:movies_app/models/movie_model.dart';

import 'dates_model.dart';

class MovieRequestModel {
  MovieDatesModel dates;
  int page;
  List<MovieModel> results;
  int totalPages;
  int totalResults;

  MovieRequestModel({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  MovieRequestModel.fromJson(Map<String, dynamic> json)
      : dates = MovieDatesModel.fromJson(json['dates'] as Map<String, dynamic>),
        page = json['page'],
        results = (json['results'] as List).map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>)).toList(),
        totalPages = json['total_pages'],
        totalResults = json['total_results'];

}
