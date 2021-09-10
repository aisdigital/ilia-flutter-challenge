import 'dart:convert';

import '../../domain/entities/movie_video_entity.dart';

class MovieVideoModel extends MovieVideo {
  MovieVideoModel({
    required String key,
    required String type,
  }) : super(
          key: key,
          type: type,
        );

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'type': type,
    };
  }

  factory MovieVideoModel.fromMap(Map<String, dynamic> map) {
    return MovieVideoModel(
      key: map['key'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieVideoModel.fromJson(String source) =>
      MovieVideoModel.fromMap(json.decode(source));

  MovieVideo toEntity() {
    return MovieVideo(
      key: key,
      type: type,
    );
  }
}
