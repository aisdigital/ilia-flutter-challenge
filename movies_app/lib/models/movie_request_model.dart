import 'package:movies_app/models/movie_model.dart';

class MovieRequestModel {
  List<String> dates;
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
    : dates = json['dates'],
      page = json['page'],
      results = List<MovieModel>.from(json['results'].map((movie) {
        return MovieModel.fromJson(movie);
      })),
      totalPages = json['total_pages'],
      totalResults = json['total_results'];

}