import 'package:teste_ilia/app/modules/home/domain/entities/filme_entity.dart';

abstract class HomeDatasource {
  Future<List<FilmeEntity>> getFilmesPopular();
  Future<List<FilmeEntity>> getFilmesRated();
  Future<List<FilmeEntity>> seachFilmes(String busca);
}