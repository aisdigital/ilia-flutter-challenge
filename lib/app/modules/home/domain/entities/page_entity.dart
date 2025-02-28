import 'package:pixel_cinema/app/modules/home/domain/entities/movie_entity.dart';

class PageEntity {
  PageEntity({
    required this.page,
    required this.movies,
  });

  factory PageEntity.fromJson(Map<String, dynamic> json) => PageEntity(
        page: json['page'],
        movies: json['results'].map<MovieEntity>((json) => MovieEntity.fromJson(json)).toList(),
      );

  final int page;
  final List<MovieEntity> movies;
}
