import 'dart:convert';

import '../../domain/entities/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetails {
  MovieDetailsModel({
    required String imagePath,
    required String overview,
    required String title,
    required double rating,
    required Duration runtime,
    required String releaseDate,
  }) : super(
          imagePath: imagePath,
          overview: overview,
          rating: rating,
          releaseDate: releaseDate,
          runtime: runtime,
          title: title,
        );

  Map<String, dynamic> toMap() {
    return {
      'backdrop_path': imagePath,
      'overview': overview,
      'title': title,
      'vote_average': rating,
      'runtime': runtime,
      'release_date': releaseDate,
    };
  }

  factory MovieDetailsModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailsModel(
      imagePath: map['backdrop_path'],
      overview: map['overview'],
      title: map['title'],
      rating: (map['vote_average'] as num).toDouble(),
      runtime: Duration(hours: map['runtime']),
      releaseDate: map['release_date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailsModel.fromJson(String source) =>
      MovieDetailsModel.fromMap(json.decode(source));

  MovieDetails toEntity() {
    return MovieDetails(
      imagePath: imagePath,
      overview: overview,
      title: title,
      rating: rating,
      runtime: runtime,
      releaseDate: releaseDate,
    );
  }
}
