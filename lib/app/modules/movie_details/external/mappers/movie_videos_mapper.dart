import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/entities/movie_videos.dart';

class MovieVideosMapper {
  Map<String, dynamic> movieVideosToJson(MovieVideos entity) {
    return {
      'id': entity.id,
      'results': entity.results,
    };
  }

  MovieVideos movieVideosFromJson(Map<String, dynamic> json) => MovieVideos(
        id: json["id"] ?? 0,
        results: json["results"] ?? [],
      );
}
