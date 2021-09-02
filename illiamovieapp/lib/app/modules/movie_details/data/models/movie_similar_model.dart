import 'dart:convert';

import '../../domain/entities/movie_similar_entity.dart';

class MovieSimilarModel extends MovieSimilar {
  MovieSimilarModel({
    required int movieId,
    required String title,
    required String moviePoster,
    required String releaseDate,
    required double rating,
  }) : super(
          movieId: movieId,
          moviePoster: moviePoster,
          rating: rating,
          releaseDate: releaseDate,
          title: title,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': movieId,
      'title': title,
      'poster_path': moviePoster,
      'release_date': releaseDate,
      'vote_average': rating,
    };
  }

  factory MovieSimilarModel.fromMap(Map<String, dynamic> map) {
    return MovieSimilarModel(
      movieId: map['id'],
      title: map['title'],
      moviePoster: map['poster_path'],
      releaseDate: map['release_date'],
      rating: (map['vote_average'] as num).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieSimilarModel.fromJson(String source) =>
      MovieSimilarModel.fromMap(json.decode(source));

  MovieSimilar toEntity() {
    return MovieSimilar(
      movieId: movieId,
      title: title,
      moviePoster: moviePoster,
      releaseDate: releaseDate,
      rating: rating,
    );
  }

  factory MovieSimilarModel.fromEntity(MovieSimilar movie) {
    return MovieSimilarModel(
      movieId: movie.movieId,
      title: movie.title,
      moviePoster: movie.moviePoster,
      releaseDate: movie.releaseDate,
      rating: movie.rating,
    );
  }
}
