import 'package:dio/dio.dart';
import 'package:ilia_challenge/interface/movie_interface.dart';
import 'package:ilia_challenge/model/details_model.dart';
import 'package:ilia_challenge/model/movies_model.dart';
import 'package:ilia_challenge/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

final streamMovie = MovieController();

class MovieController implements InterfaceMovie {
  final RepositoryMovie _repository = RepositoryMovie();

  BehaviorSubject<MoviesModel?> _behaviorSubjectMoviesOnTheater =
      BehaviorSubject.seeded(null);

  BehaviorSubject<DetailModel?> _behaviorSubjectDetail =
      BehaviorSubject.seeded(null);

  BehaviorSubject<MoviesModel?> get movies => _behaviorSubjectMoviesOnTheater;

  BehaviorSubject<DetailModel?> get details => _behaviorSubjectDetail;

  void dispose() {
    _behaviorSubjectMoviesOnTheater.close();
    _behaviorSubjectDetail.close();
  }

  @override
  Future<Response?> getMovieDetailsById(sendData) async {
    _behaviorSubjectDetail.sink.add(null);
    Response? response = await _repository.getMovieDetailsById(sendData);
    _behaviorSubjectDetail.sink.add(DetailModel.fromJson(response!.data));
    return response;
  }

  @override
  Future<Response?> getMovieSearchQuery(sendData) async {
    return _repository.getMovieSearchQuery(sendData);
  }

  @override
  Future<Response?> listMovieCurrentTheater({int? nextPage}) async {
    Response? response =
        await _repository.listMovieCurrentTheater(nextPage: nextPage);
    if (_behaviorSubjectMoviesOnTheater.value == null) {
      _behaviorSubjectMoviesOnTheater.sink
          .add(MoviesModel.fromJson(response!.data));
    } else {
      var aux = MoviesModel.fromJson(response!.data);
      _behaviorSubjectMoviesOnTheater.value!.results!.addAll(aux.results!);
      _behaviorSubjectMoviesOnTheater.value!.page = aux.page;
      _behaviorSubjectMoviesOnTheater.sink
          .add(_behaviorSubjectMoviesOnTheater.value);
    }
    return response;
  }

  @override
  Future<Response?> listMovieTendency() async {
    return _repository.listMovieTendency();
  }

  @override
  Future<Response?> getMovieVideosById(sendData) {
    return _repository.getMovieVideosById(sendData);
  }
}
