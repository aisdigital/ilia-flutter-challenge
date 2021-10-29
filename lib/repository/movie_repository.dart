import 'package:dio/src/response.dart';
import 'package:ilia_challenge/interface/movie_interface.dart';
import 'package:ilia_challenge/provider/movie_provider.dart';

class RepositoryMovie implements InterfaceMovie {
  ProviderMovie _providerMovie = ProviderMovie();

  @override
  Future<Response?> getMovieDetailsById(sendData) {
    return _providerMovie.getMovieDetailsById(sendData);
  }

  @override
  Future<Response?> getMovieSearchQuery(sendData) {
    return _providerMovie.getMovieSearchQuery(sendData);
  }

  @override
  Future<Response?> listMovieCurrentTheater() async {
    return _providerMovie.listMovieCurrentTheater();
  }

  @override
  Future<Response?> listMovieTendency() {
    return _providerMovie.listMovieTendency();
  }

  @override
  Future<Response?> listMovieUpcomingTheater() {
    return _providerMovie.listMovieUpcomingTheater();
  }

  @override
  Future<Response?> getMovieVideosById(sendData) {
    return _providerMovie.getMovieVideosById(sendData);
  }
}
