import 'package:dio/dio.dart';
import 'package:ilia_challenge/interface/movie_interface.dart';
import 'package:ilia_challenge/repository/movie_repository.dart';

final streamMovie = MovieController();

class MovieController implements InterfaceMovie {
  final RepositoryMovie _repository = RepositoryMovie();

  @override
  Future<Response?> getMovieDetailsById(sendData) async {
    return _repository.getMovieDetailsById(sendData);
  }

  @override
  Future<Response?> getMovieSearchQuery(sendData) async {
    return _repository.getMovieSearchQuery(sendData);
  }

  @override
  Future<Response?> listMovieCurrentTheater() async {
    return _repository.listMovieCurrentTheater();
  }

  @override
  Future<Response?> listMovieTendency() async {
    return _repository.listMovieTendency();
  }

  @override
  Future<Response?> listMovieUpcomingTheater() async {
    return _repository.listMovieUpcomingTheater();
  }

  @override
  Future<Response?> getMovieVideosById(sendData) {
    return _repository.getMovieVideosById(sendData);
  }
}
