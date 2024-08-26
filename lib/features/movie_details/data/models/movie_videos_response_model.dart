import 'package:movie_catalog/features/movie_details/data/models/movie_video_model.dart';
import 'package:movie_catalog/features/movie_details/domain/entities/movie_videos_response.dart';

class MovieVideosResponseModel extends MovieVideosResponse {
  MovieVideosResponseModel({
    required super.id,
    required super.results,
  });

  factory MovieVideosResponseModel.fromJson(Map<String, dynamic> json) {
    return MovieVideosResponseModel(
      id: json['id'],
      results: (json['results'] as List).map((result) => MovieVideoModel.fromJson(result)).toList(),
    );
  }

  MovieVideosResponseModel copyWith({
    int? id,
    List<MovieVideoModel>? results,
  }) {
    return MovieVideosResponseModel(
      id: id ?? this.id,
      results: results ?? this.results,
    );
  }
}
