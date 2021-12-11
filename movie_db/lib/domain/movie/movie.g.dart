// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$$_MovieFromJson(Map<String, dynamic> json) => _$_Movie(
      json['backdropPath'] as String,
      json['id'] as int,
      json['originalLanguage'] as String,
      json['originalTitle'] as String,
      json['overview'] as String,
      (json['popularity'] as num).toDouble(),
      json['posterPath'] as String,
      json['releaseDate'] as String,
      json['title'] as String,
      json['video'] as bool,
      json['voteCount'] as int,
      json['voteAverage'] as String,
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'backdropPath': instance.backdropPath,
      'id': instance.id,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'releaseDate': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'voteCount': instance.voteCount,
      'voteAverage': instance.voteAverage,
    };
