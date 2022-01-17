import 'package:flutter/material.dart';

import 'package:teste_ilia/app/modules/home/domain/entities/filme_entity.dart';
import 'package:teste_ilia/app/modules/home/domain/erros/filmes_popular_error.dart';

abstract class PopularState {}

class PopularInitialState implements PopularState {}

class PopularLoadingState implements PopularState {}

class PopularErrorState implements PopularState {
  final FPopularError error;
  PopularErrorState({
    @required this.error,
  });
}

class PopularSucessState implements PopularState {
  final List<FilmeEntity> list;
  PopularSucessState({
    @required this.list,
  });
}
