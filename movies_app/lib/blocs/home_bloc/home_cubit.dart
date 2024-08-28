import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/blocs/home_bloc/home_state.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/models/movie_request_model.dart';
import 'package:movies_app/services/get_movies_client.dart';

class HomeCubit extends Cubit<HomeState> {
  final IGetMoviesClient _getMoviesClient;

  HomeCubit(this._getMoviesClient) : super(const HomeState());

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
      moviesInfo: [],
    ));

    await getMovies();
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
    final moviesInfo = moviesRequest.results;

    emit(state.copyWith(
      moviesInfo: moviesInfo,
      moviesRequest: moviesRequest,
      isLoading: false,
      hasError: false,
      errorMessage: '',
      success: true,
    ));
  }

  void setSelectedMovie(MovieModel selectedMovie) {
    emit(state.copyWith(
      selectedMovie: selectedMovie,
    ));
  }
}
