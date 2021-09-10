import 'package:equatable/equatable.dart';

import '../../../../core/const/api_const.dart';

class MovieSimilar extends Equatable {
  final int movieId;
  final String title;
  final String moviePoster;
  final String releaseDate;
  final double rating;
  MovieSimilar({
    required this.movieId,
    required this.title,
    required this.moviePoster,
    required this.releaseDate,
    required this.rating,
  });

  MovieSimilar copyWith({
    int? movieId,
    String? title,
    String? moviePoster,
    String? releaseDate,
    double? rating,
  }) {
    return MovieSimilar(
      movieId: movieId ?? this.movieId,
      title: title ?? this.title,
      moviePoster: moviePoster ?? this.moviePoster,
      releaseDate: releaseDate ?? this.releaseDate,
      rating: rating ?? this.rating,
    );
  }

  String posterUrl({required String width}) =>
      '${ApiConst.imageApiUrl(width)}$moviePoster';

  String get releaseDateFormatted => releaseDate.split('-').reversed.join('/');

  @override
  List<Object> get props {
    return [
      movieId,
      title,
      moviePoster,
      releaseDate,
      rating,
    ];
  }
}
