import 'package:flutter/material.dart';
import 'package:teste_ilia/app/modules/home/domain/entities/filme_entity.dart';
import 'package:teste_ilia/app/modules/home/domain/erros/search_filmes_error.dart';

abstract class SearchFilmesState {}

class SearchFilmesInitial implements SearchFilmesState {}

class SearchFilmesLoading implements SearchFilmesState {}

class SearchFilmesNoResult implements SearchFilmesState {}

class SearchFilmesFailure implements SearchFilmesState {
  final SearchFilmesError error;
  SearchFilmesFailure({
    @required this.error,
  });
}

class SearchFilmesSucess implements SearchFilmesState {
  final List<FilmeEntity> list;
  SearchFilmesSucess(this.list);
}
