import 'package:teste_ilia/app/modules/home/domain/entities/filme_entity.dart';

class FilmesMappers extends FilmeEntity {
  int id;
  String title;
  String capa;
  double votos;

  FilmesMappers({
    this.id,
    this.title,
    this.capa,
    this.votos,
  });

  factory FilmesMappers.fromMap(Map<String, dynamic> map) {
    return FilmesMappers(
      id: map['id']?.toInt() ?? 0,
      title: map['original_title'] ?? '',
      capa: map['poster_path'] ?? '',
      votos: map['vote_average']?.toDouble() ?? 0.0,
    );
  }

  static List<FilmesMappers> fromJsonList(List list){
    if (list == null) {
      return [];
    }
    return list.map((e) => FilmesMappers.fromMap(e)).toList();
  }
}
