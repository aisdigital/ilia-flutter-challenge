import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:teste_ilia/app/modules/home/domain/entities/filme_entity.dart';
import 'package:teste_ilia/app/modules/home/domain/erros/filmes_rated_error.dart';
import 'package:teste_ilia/app/modules/home/domain/repository/home_repository.dart';

abstract class GetFilmesRatedUsecases {
  Future<Either<FRatedError, List<FilmeEntity>>> call();
}

class GetFilmesRatedUsecasesImpl implements GetFilmesRatedUsecases {

  final HomeRepository homeRepository;
  GetFilmesRatedUsecasesImpl({
    @required this.homeRepository,
  });
  
  @override
  Future<Either<FRatedError, List<FilmeEntity>>> call() async {
    return await homeRepository.getFilmesRated();
  }
  
}
