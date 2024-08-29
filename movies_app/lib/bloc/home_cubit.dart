import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/bloc/home_state.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/models/movie_request_model.dart';
import 'package:movies_app/models/videos_request_model.dart';
import 'package:movies_app/services/api_configurations/get_configurations_client.dart';
import 'package:movies_app/services/movies/get_movies_client.dart';

import '../models/api_configuration_model.dart';
import '../models/video_model.dart';
import '../services/videos/get_videos_client.dart';

class HomeCubit extends Cubit<HomeState> {
  final IGetMoviesClient _getMoviesClient;
  final IGetConfigurationsClient _getConfigurationsClient;
  final IGetVideosClient _getVideosClient;

  HomeCubit(
    this._getMoviesClient,
    this._getConfigurationsClient,
    this._getVideosClient,
  ) : super(const HomeState());

  bool _initialized = false;

  void reload() {
    _initialized = false;
    init();
  }

  Future<void> init() async {
    if (_initialized) return;
    await Future.delayed(const Duration(milliseconds: 100));
    emit(state.copyWith(
      isLoading: true,
      hasError: false,
      errorMessage: '',
      movies: [],
    ));

    await getConf();
    await getMovies();
  }

  Future<void> getConf() async {
    var result = await _getConfigurationsClient.requestConfigurations();

    if (!result.success) {
      emit(state.copyWith(
        hasError: true,
        errorMessage: result.value,
        isLoading: false,
      ));
      return;
    }

    final apiConfigurations = result.value as ApiConfigurationModel;

    emit(state.copyWith(
      apiConfigurations: apiConfigurations,
      isLoading: false,
      hasError: false,
      errorMessage: '',
      success: true,
    ));
  }

  Future<void> getMovies() async {
    var result = await _getMoviesClient.requestMovies();

    if (!result.success) {
      emit(state.copyWith(
        hasError: true,
        errorMessage: result.value,
        isLoading: false,
      ));
      return;
    }

    final moviesRequest = result.value as MovieRequestModel;
    final movies = moviesRequest.results;

    for (var movie in movies) {
      movie.trailerKey = await getTrailer(movie.id.toString());
    }

    emit(state.copyWith(
      movies: movies,
      moviesRequest: moviesRequest,
      isLoading: false,
      hasError: false,
      errorMessage: '',
      success: true,
    ));
  }

  Future<String> getTrailer(String movieId) async {
    var result = await _getVideosClient.requestVideos(movieId);

    if (!result.success) {
      emit(state.copyWith(
        hasError: true,
        errorMessage: result.value,
        isLoading: false,
      ));
      return '';
    }

    final videosRequest = result.value as VideosRequestModel;
    final videos = videosRequest.results;
  
    for (VideoModel video in videos) {
      if (video.type == 'Trailer') {
        return video.key;
      }
    }

    return '';
  }

  void setSelectedMovie(MovieModel selectedMovie) => emit(state.copyWith(selectedMovie: selectedMovie));

  void setIsListView(bool isListView) => emit(state.copyWith(isListView: isListView));
}
