import 'dart:convert';

import 'movie.dart';

class MovieResponseModel {
  int page;
  final int totalResults;
  final int totalPages;
  final List<Movie>? movies;

  MovieResponseModel({
    required this.page,
    required this.totalResults,
    required this.totalPages,
    required this.movies,
  });

  factory MovieResponseModel.fromJson(String str) =>
      MovieResponseModel.fromMap(json.decode(str));

  factory MovieResponseModel.fromMap(Map<String, dynamic> json) =>
      MovieResponseModel(
        page: json["page"],
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
        movies: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
      );
}
