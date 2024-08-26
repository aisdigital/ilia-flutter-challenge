import 'package:service/movie/entities/genre_entity.dart';

class GenreAdapter {
  static GenreEntity fromJson(Map<String, dynamic> json) {
    return GenreEntity(
      id: json['id'],
      name: json['name'],
    );
  }

  static Map<String, dynamic> toJson({required GenreEntity entity}) {
    return {
      'id': entity.id,
      'name': entity.name,
    };
  }
}
