import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:teste_ilia/app/modules/home/domain/entities/filme_entity.dart';
import 'package:teste_ilia/app/modules/home/external/mappers/filmes_mapper.dart';
import 'package:teste_ilia/app/modules/home/infra/datasource/home_datasource.dart';

class HomeDataSourceImpl implements HomeDatasource {

  final Dio dio;
  HomeDataSourceImpl({
    @required this.dio,
  });
  
  @override
  Future<List<FilmeEntity>> getFilmesPopular() async {
    Response response = await dio.get('/movie/popular');
    return FilmesMappers.fromJsonList(response.data['results']);
  }

  @override
  Future<List<FilmeEntity>> getFilmesRated() async {
    Response response = await dio.get('/movie/top_rated');
    return FilmesMappers.fromJsonList(response.data['results']);
  }

  @override
  Future<List<FilmeEntity>> seachFilmes(String busca) async {
    Response response = await dio.get('/search/movie?query=$busca');
    return FilmesMappers.fromJsonList(response.data['results']);
  }
  
}
