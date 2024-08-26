import 'package:service/movie/entities/video_entity.dart';

class VideoAdapter {
  static VideoEntity fromJson(Map<String, dynamic> json) {
    return VideoEntity(
      iso6391: json['iso_639_1'],
      iso31661: json['iso_3166_1'],
      name: json['name'],
      key: json['key'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
      official: json['official'],
      publishedAt: DateTime.parse(json['published_at']),
      id: json['id'],
    );
  }

  static Map<String, dynamic> toJson({required VideoEntity entity}) {
    return {
      'iso_639_1': entity.iso6391,
      'iso_3166_1': entity.iso31661,
      'name': entity.name,
      'key': entity.key,
      'site': entity.site,
      'size': entity.size,
      'type': entity.type,
      'official': entity.official,
      'published_at': entity.publishedAt.toIso8601String(),
      'id': entity.id,
    };
  }
}
