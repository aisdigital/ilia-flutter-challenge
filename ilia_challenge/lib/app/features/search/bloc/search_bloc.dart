import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ilia_challenge/app/models/movie.dart';
import 'package:ilia_challenge/app/service/discover_movies.dart';
import 'package:ilia_challenge/app/service/search_movies_service.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchInitialEvent>(searchInitialEvent);
    on<SearchMovieEvent>(searchMovieEvent);
  }

  FutureOr<void> searchInitialEvent(
      SearchInitialEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoadingState());
    await Future.delayed(Duration(seconds: 1));
    try {
      final movies = await DiscoverMoviesService().fetchAllMovies();
      emit(SearchLoadedSuccessState(movies: movies));
    } catch (e) {
      emit(SearchErrorState());
    }
  }

  FutureOr<void> searchMovieEvent(
      SearchMovieEvent event, Emitter<SearchState> emit) async {
    final loadedmovies = await DiscoverMoviesService().fetchAllMovies();
    if (event.query.isEmpty) {
      emit(SearchLoadedSuccessState(movies: loadedmovies));
      return;
    }
    final movies = await SearchMoviesService().fetchAllMovies(event.query);

    final filteredMovies = movies
        .where((movie) =>
            movie.title.toLowerCase().contains(event.query.toLowerCase()))
        .toList();

    emit(SearchedMovieState(movies: filteredMovies));
  }
}
