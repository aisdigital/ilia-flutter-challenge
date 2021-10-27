import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:teste_ilia/app/modules/home/models/filmes.dart';
import 'package:teste_ilia/app/shared/exception/public_message.dart';
import 'package:teste_ilia/app/shared/util/api_key.dart';

class HomeService {

  final Dio _dio = Dio(dioOptions);

  Future<List<Filmes>> getFilmesPopular() async {
    try {
      Response response = await _dio.get('/movie/popular');
      return Filmes.fromJsonList(response.data['results']);
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw PublicMessageException('Verifique sua conexão');
      }
      throw PublicMessageException('Erro ao carregar dados');
    }
  }
  
  Future<List<Filmes>> getFilmesRated() async {
    try {
      Response response = await _dio.get('/movie/top_rated');
      print(response.data);
      return Filmes.fromJsonList(response.data['results']);
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw PublicMessageException('Verifique sua conexão');
      }
      print(e);
      throw PublicMessageException('Erro ao carregar dados');
    }
  }
}