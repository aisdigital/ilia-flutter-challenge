import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_flutter_challenge/app/modules/home/domain/entities/now_playing_movies_search_result.dart';
import 'package:ilia_flutter_challenge/app/modules/home/domain/usecases/fetch_now_playing_movies_usecase.dart';

part 'home_state.dart';

class HomeStore extends Cubit<HomeState> {
  HomeStore(this.fetchNowPlayingMoviesUsecase) : super(const HomeState());

  final FetchNowPlayingMoviesUsecase fetchNowPlayingMoviesUsecase;

  Future<void> fetchNowPlayingMovies() async {
    emit(state.copyWith(state: const LoadingHomeState()));

    final response = await fetchNowPlayingMoviesUsecase(state.pageNumber);

    response.fold(
      (success) => emit(
        state.copyWith(
          state: const SuccessHomeState(),
          nowPlayingMovies: success,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          state: const FailureHomeState(),
        ),
      ),
    );
  }

  void changePageNumber(String pageNumber) {
    emit(
      state.copyWith(
        state: const LoadingHomeState(),
        pageNumber: pageNumber,
      ),
    );

    fetchNowPlayingMovies();
  }

  Future<void> searchMovies(String movieName) async {
    List<dynamic> findMoviesList = [];

    emit(state.copyWith(state: const LoadingSearchMovieHomeState()));

    while (state.currentSearchPage <= state.nowPlayingMovies.totalPages) {
      final response = await fetchNowPlayingMoviesUsecase(
        state.currentSearchPage.toString(),
      );

      response.fold(
        (success) {
          for (var movie in success.results) {
            if (movie["title"].toLowerCase().contains(movieName)) {
              findMoviesList.add(movie);
            }
          }
        },
        (failure) => emit(
          state.copyWith(
            state: const FailureHomeState(),
          ),
        ),
      );

      emit(state.copyWith(currentSearchPage: state.currentSearchPage + 1));
    }

    if (findMoviesList.isEmpty) {
      emit(
        state.copyWith(
          state: const FailureHomeState(),
          pageNumber: '1',
          currentSearchPage: 1,
        ),
      );
    } else {
      emit(
        state.copyWith(
          state: const SuccessSearchMovieHomeState(),
          findMoviesList: findMoviesList,
          pageNumber: '1',
          currentSearchPage: 1,
        ),
      );
    }
  }
}
