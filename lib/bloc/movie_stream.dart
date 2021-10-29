import 'package:dio/dio.dart';
import 'package:ilia_challenge/interface/movie_interface.dart';
import 'package:ilia_challenge/model/movies_model.dart';
import 'package:ilia_challenge/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

final streamMovie = MovieController();

class MovieController implements InterfaceMovie {
  final RepositoryMovie _repository = RepositoryMovie();

  BehaviorSubject<MoviesModel?> _behaviorSubjectMoviesUpComing =
      BehaviorSubject.seeded(null);

  BehaviorSubject<MoviesModel?> _behaviorSubjectMoviesTendecy =
      BehaviorSubject.seeded(null);

  BehaviorSubject<MoviesModel?> behaviorSubjectMoviesOnTheater =
      BehaviorSubject.seeded(null);

  BehaviorSubject<MoviesModel?> _behaviorSubjectMoviesSearch =
      BehaviorSubject.seeded(null);

  @override
  Future<Response?> getMovieDetailsById(sendData) async {
    return _repository.getMovieDetailsById(sendData);
  }

  @override
  Future<Response?> getMovieSearchQuery(sendData) async {
    return _repository.getMovieSearchQuery(sendData);
  }

  @override
  Future<Response?> listMovieCurrentTheater({int? nextPage}) async {
    Response? response =
        await _repository.listMovieCurrentTheater(nextPage: nextPage);
    if (behaviorSubjectMoviesOnTheater.value == null) {
      behaviorSubjectMoviesOnTheater.sink
          .add(MoviesModel.fromJson(response!.data));
    } else {
      var aux = MoviesModel.fromJson(response!.data);
      behaviorSubjectMoviesOnTheater.value!.results!.addAll(aux.results!);
      behaviorSubjectMoviesOnTheater.value!.page = aux.page;
      behaviorSubjectMoviesOnTheater.sink
          .add(behaviorSubjectMoviesOnTheater.value);
    }
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
