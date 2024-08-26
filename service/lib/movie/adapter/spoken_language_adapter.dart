import 'package:service/movie/entities/spoken_language_entity.dart';

class SpokenLanguageAdapter {
  static SpokenLanguageEntity fromJson(Map<String, dynamic> json) {
    return SpokenLanguageEntity(
      englishName: json['english_name'],
      iso6391: json['iso_639_1'],
      name: json['name'],
    );
  }

  static Map<String, dynamic> toJson({required SpokenLanguageEntity entity}) {
    return {
      'english_name': entity.englishName,
      'iso_639_1': entity.iso6391,
      'name': entity.name,
    };
  }
}
