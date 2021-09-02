import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final String imagePath;
  final String overview;
  final String title;
  final double rating;
  final Duration runtime;
  final String releaseDate;
  MovieDetails({
    required this.imagePath,
    required this.overview,
    required this.title,
    required this.rating,
    required this.runtime,
    required this.releaseDate,
  });

  MovieDetails copyWith({
    String? imagePath,
    String? overview,
    String? title,
    double? rating,
    Duration? runtime,
    String? releaseDate,
  }) {
    return MovieDetails(
      imagePath: imagePath ?? this.imagePath,
      overview: overview ?? this.overview,
      title: title ?? this.title,
      rating: rating ?? this.rating,
      runtime: runtime ?? this.runtime,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }

  @override
  List<Object> get props {
    return [
      imagePath,
      overview,
      title,
      rating,
      runtime,
      releaseDate,
    ];
  }
}
