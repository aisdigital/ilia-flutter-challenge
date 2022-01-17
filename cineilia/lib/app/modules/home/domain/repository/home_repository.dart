import 'package:dartz/dartz.dart';
import 'package:teste_ilia/app/modules/home/domain/entities/filme_entity.dart';
import 'package:teste_ilia/app/modules/home/domain/erros/filmes_popular_error.dart';
import 'package:teste_ilia/app/modules/home/domain/erros/filmes_rated_error.dart';
import 'package:teste_ilia/app/modules/home/domain/erros/search_filmes_error.dart';

abstract class HomeRepository {
  Future<Either<FPopularError, List<FilmeEntity>>> getFilmesPopular();
  Future<Either<FRatedError, List<FilmeEntity>>> getFilmesRated();
  Future<Either<SearchFilmesError, List<FilmeEntity>>> seachFilmes(String busca);
}