import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:teste_ilia/app/modules/home/domain/entities/filme_entity.dart';
import 'package:teste_ilia/app/modules/home/domain/erros/search_filmes_error.dart';
import 'package:teste_ilia/app/modules/home/domain/repository/home_repository.dart';

abstract class SearchFilmesUsecases {
  Future<Either<SearchFilmesError, List<FilmeEntity>>> call(String busca);
}

class SearchFilmesUsacasesImpl implements SearchFilmesUsecases {

  final HomeRepository homeRepository;
  SearchFilmesUsacasesImpl({
    @required this.homeRepository,
  });
  
  @override
  Future<Either<SearchFilmesError, List<FilmeEntity>>> call(String busca) async {
    if (busca == null) {
      return left(SearchFilmesError('Busca vazia'));
    }
    return await homeRepository.seachFilmes(busca);
  }
  
}
