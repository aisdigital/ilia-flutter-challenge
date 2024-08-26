import 'package:movie_catalog/core/common/entities/genre.dart';

class GenreModelDetail extends Genre {
  GenreModelDetail({
    required super.id,
    required super.name,
  });

  factory GenreModelDetail.fromJson(Map<String, dynamic> json) {
    return GenreModelDetail(
      id: json['id'],
      name: json['name'],
    );
  }
}
