import 'dart:async';
import 'package:teste_ilia/app/modules/home/models/filmes.dart';
import 'package:teste_ilia/app/modules/home/service/home_service.dart';

class HomeController {

  final HomeService service;

  HomeController({
    this.service
  });
  
  final _filmesPopularController = StreamController<List<Filmes>>();
  Sink<List<Filmes>> get filmesPopularIn => _filmesPopularController.sink;
  Stream<List<Filmes>> get filmesPopularOut => _filmesPopularController.stream;

  final _filmesRatedController = StreamController<List<Filmes>>();
  Sink<List<Filmes>> get filmesRatedIn => _filmesRatedController.sink;
  Stream<List<Filmes>> get filmesRatedOut => _filmesRatedController.stream;

  getFilmesPopular() async {
    List<Filmes> dados = await service.getFilmesPopular();
    filmesPopularIn.add(dados);
  }
  getFilmesRated() async {
    List<Filmes> dados = await service.getFilmesRated();
    filmesRatedIn.add(dados);
  }
  
  getFilmesSeachPopular() async {
    List<Filmes> dados = await service.getFilmesPopular();
    return dados;
  }

  dispose(){
    _filmesPopularController.close();
    _filmesRatedController.close();
  }
}