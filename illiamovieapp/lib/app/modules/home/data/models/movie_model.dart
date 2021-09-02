import 'dart:convert';

import '../../domain/entities/movie_entity.dart';

class MovieModel extends Movie {
  MovieModel({
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

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      movieId: map['id'],
      title: map['title'],
      moviePoster: map['poster_path'],
      releaseDate: map['release_date'],
      rating: (map['vote_average'] as num).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));

  Movie toEntity() {
    return Movie(
      movieId: movieId,
      title: title,
      moviePoster: moviePoster,
      releaseDate: releaseDate,
      rating: rating,
    );
  }

  factory MovieModel.fromEntity(Movie movie) {
    return MovieModel(
      movieId: movie.movieId,
      title: movie.title,
      moviePoster: movie.moviePoster,
      releaseDate: movie.releaseDate,
      rating: movie.rating,
    );
  }
}
