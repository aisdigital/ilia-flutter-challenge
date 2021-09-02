import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/const/api_const.dart';
import '../../../../core/domain/enums/control_state_enum.dart';
import '../../../home/home_module.dart';
import '../../domain/entities/movie_similar_entity.dart';

import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/movie_video_entity.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_movie_similars_usecase.dart';
import '../../domain/usecases/get_movie_video_usecase.dart';
import 'package:mobx/mobx.dart';

part 'movie_details_controller.g.dart';

class MovieDetailsController = _MovieDetailsControllerBase
    with _$MovieDetailsController;

abstract class _MovieDetailsControllerBase with Store {
  final String movieId;
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  final GetMovieSimilarsUseCase _getMovieSimilarsUseCase;
  final GetMovieVideoUseCase _getMovieVideoUseCase;

  _MovieDetailsControllerBase({
    required GetMovieDetailsUseCase getMovieDetailsUseCase,
    required GetMovieSimilarsUseCase getMovieSimilarsUseCase,
    required GetMovieVideoUseCase getMovieVideoUseCase,
    required this.movieId,
  })  : _getMovieDetailsUseCase = getMovieDetailsUseCase,
        _getMovieSimilarsUseCase = getMovieSimilarsUseCase,
        _getMovieVideoUseCase = getMovieVideoUseCase {
    _pipeline();
  }

  final ScrollController scrollController = ScrollController();

  @observable
  ControlState state = ControlState.start;
  @observable
  ObservableList<MovieSimilar> similarMovies = <MovieSimilar>[].asObservable();
  @observable
  MovieDetails? movieDetails;
  @observable
  String videoPath = '';

  @action
  void handleTapMovie({required int movieId}) {
    Modular.to.pushNamed(
      HomeModule.routeToDetails,
      arguments: {'movieId': '$movieId'},
    );
  }

  Future<void> _pipeline() async {
    try {
      state = ControlState.loading;
      movieDetails = await _getDetails();
      videoPath = ApiConst.youtubePath((await _getVideo()).key);
      similarMovies = (await _getMovies()).asObservable();
      state = ControlState.sucess;
    } catch (e) {}
  }

  Future<List<MovieSimilar>> _getMovies() async {
    final failureOrMovies = await _getMovieSimilarsUseCase(
      ParamsGetMovieSimilar(movieId: movieId),
    );

    return failureOrMovies.fold(
      (failure) => throw failure,
      (movies) => movies,
    );
  }

  Future<MovieVideo> _getVideo() async {
    final failureOrVideo = await _getMovieVideoUseCase(
      ParamsGetMovieVideo(movieId: movieId),
    );

    return failureOrVideo.fold(
      (failure) => throw failure,
      (video) => video.firstWhere((element) => element.type == 'Trailer'),
    );
  }

  Future<MovieDetails> _getDetails() async {
    final failureOrDetails = await _getMovieDetailsUseCase(
      ParamsGetMovieDetails(movieId: movieId),
    );

    return failureOrDetails.fold(
      (failure) => throw failure,
      (details) => details,
    );
  }
}
