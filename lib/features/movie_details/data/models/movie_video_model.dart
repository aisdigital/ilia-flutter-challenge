import 'package:movie_catalog/features/movie_details/domain/entities/movie_video.dart';

class MovieVideoModel extends MovieVideo {
  MovieVideoModel({
    required super.name,
    required super.key,
    super.iso6391,
    super.iso31661,
    super.site,
    super.size,
    super.type,
    super.official,
    super.publishedAt,
    super.id,
  });

  factory MovieVideoModel.fromJson(Map<String, dynamic> json) {
    return MovieVideoModel(
      name: json['name'],
      key: json['key'],
      iso6391: json['iso_639_1'],
      iso31661: json['iso_3166_1'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
      official: json['official'],
      publishedAt: json['published_at'] != null ? DateTime.parse(json['published_at']) : null,
      id: json['id'],
    );
  }

  MovieVideoModel copyWith({
    String? name,
    String? key,
    String? iso6391,
    String? iso31661,
    String? site,
    int? size,
    String? type,
    bool? official,
    DateTime? publishedAt,
    String? id,
  }) {
    return MovieVideoModel(
      name: name ?? this.name,
      key: key ?? this.key,
      iso6391: iso6391 ?? this.iso6391,
      iso31661: iso31661 ?? this.iso31661,
      site: site ?? this.site,
      size: size ?? this.size,
      type: type ?? this.type,
      official: official ?? this.official,
      publishedAt: publishedAt ?? this.publishedAt,
      id: id ?? this.id,
    );
  }
}
