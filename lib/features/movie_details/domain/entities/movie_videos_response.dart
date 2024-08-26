import 'package:movie_catalog/features/movie_details/domain/entities/movie_video.dart';

class MovieVideosResponse {
  final int id;
  final List<MovieVideo> results;

  const MovieVideosResponse({
    required this.id,
    required this.results,
  });
}
