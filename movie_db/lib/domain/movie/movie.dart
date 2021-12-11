import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory Movie(
    String backdropPath,
    int id,
    String originalLanguage,
    String originalTitle,
    String overview,
    double popularity,
    String posterPath,
    String releaseDate,
    String title,
    bool video,
    int voteCount,
    String voteAverage,
  ) = _Movie;
  const Movie._();

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
