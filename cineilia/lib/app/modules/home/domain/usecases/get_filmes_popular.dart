import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:teste_ilia/app/modules/home/domain/entities/filme_entity.dart';
import 'package:teste_ilia/app/modules/home/domain/erros/filmes_popular_error.dart';
import 'package:teste_ilia/app/modules/home/domain/repository/home_repository.dart';

abstract class GetFilmesPopularUsecases {
  Future<Either<FPopularError, List<FilmeEntity>>> call();
}

class GetFilmesPopularUsecasesImpl implements GetFilmesPopularUsecases {

  final HomeRepository homeRepository;
  GetFilmesPopularUsecasesImpl({
    @required this.homeRepository,
  });
  
  @override
  Future<Either<FPopularError, List<FilmeEntity>>> call() async {
    return await homeRepository.getFilmesPopular();
  }
  
}
