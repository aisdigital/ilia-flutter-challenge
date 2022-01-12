import 'package:flutter/material.dart';

import 'package:teste_ilia/app/modules/home/domain/entities/filme_entity.dart';
import 'package:teste_ilia/app/modules/home/domain/erros/filmes_rated_error.dart';

abstract class FilmesRatedState {}


class FilmesRatedInitial implements FilmesRatedState {}

class FilmesRatedLoading implements FilmesRatedState {}

class FilmesRatedFailure implements FilmesRatedState {
  final FRatedError error;
  FilmesRatedFailure({
    @required this.error,
  });
}

class FilmesRatedSucess implements FilmesRatedState {
  final List<FilmeEntity> list;
  FilmesRatedSucess({
    @required this.list,
  });
}
