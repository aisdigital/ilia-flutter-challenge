import 'package:movie_catalog/core/common/entities/genre_response.dart';
import 'package:movie_catalog/features/movies_list/data/models/models.dart';

class GenreResponseModel extends GenreResponse {
  GenreResponseModel({
    required super.genres,
  });

  factory GenreResponseModel.fromJson(Map<String, dynamic> json) {
    return GenreResponseModel(
      genres: (json['genres'] as List<dynamic>).map((genre) => GenreModel.fromJson(genre)).toList(),
    );
  }
}
