import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:teste_ilia/app/modules/home/domain/entities/filme_entity.dart';
import 'package:teste_ilia/app/modules/home/domain/erros/filmes_popular_error.dart';
import 'package:teste_ilia/app/modules/home/domain/erros/filmes_rated_error.dart';
import 'package:teste_ilia/app/modules/home/domain/erros/search_filmes_error.dart';
import 'package:teste_ilia/app/modules/home/domain/repository/home_repository.dart';
import 'package:teste_ilia/app/modules/home/infra/datasource/home_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {

  final HomeDatasource homeDatasource;
  HomeRepositoryImpl({
    @required this.homeDatasource,
  });

  @override
  Future<Either<FPopularError, List<FilmeEntity>>> getFilmesPopular() async {
    try {
      var result = await homeDatasource.getFilmesPopular();
      return Right(result);
    } on SocketException catch (e,s) {
      throw Left(FPopularError('Error de conexão',trace: s));
    } on FPopularError catch (e,s) {
      throw Left(FPopularError('Error ao carregar filmes',trace: s));
    }
  }

  @override
  Future<Either<FRatedError, List<FilmeEntity>>> getFilmesRated() async {
    try {
      var result = await homeDatasource.getFilmesRated();
      return Right(result);
    } on SocketException catch (e,s) {
      throw Left(FRatedError('Error de conexão',trace: s));
    } on FRatedError catch (e,s) {
      throw Left(FRatedError('Error ao carregar filmes',trace: s));
    }
  }

  @override
  Future<Either<SearchFilmesError, List<FilmeEntity>>> seachFilmes(String busca) async {
    try {
      var result = await homeDatasource.seachFilmes(busca);
      return Right(result);
    } on SocketException catch (e) {
      throw Left(SearchFilmesError('Error de conexão'));
    } on SearchFilmesError catch (e) {
      throw Left(SearchFilmesError('Error ao carregar filmes'));
    }
  }
  
}
