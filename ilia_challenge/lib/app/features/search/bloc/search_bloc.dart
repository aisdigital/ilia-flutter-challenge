import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ilia_challenge/app/models/movie.dart';
import 'package:ilia_challenge/app/service/discover_movies.dart';
import 'package:ilia_challenge/app/service/search_movies_service.dart';
import 'package:meta/meta.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  late ScrollController scrollController;
  SearchBloc() : super(SearchInitial()) {
    scrollController = ScrollController();
    on<SearchInitialEvent>(searchInitialEvent);
    on<SearchMovieEvent>(searchMovieEvent);
  }
  int currentPage = 1;
  bool loading = false;
  late List<Movie> moviesList;

  FutureOr<void> searchInitialEvent(
      SearchInitialEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoadingState());
    try {
      final movies = await DiscoverMoviesService().fetchAllMovies(currentPage);
      moviesList = movies;
      emit(SearchLoadedSuccessState(movies: movies));
    } catch (e) {
      emit(SearchErrorState());
    }
  }

  void setupScrollListener() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !loading) {
        loading = true;
        currentPage++;
        final moreMovies =
            await DiscoverMoviesService().fetchAllMovies(currentPage);
        emit(SearchLoadedMoreMoviesSuccessState(
            movies: [...moviesList, ...moreMovies]));
        moviesList = [...moviesList, ...moreMovies];

        loading = false;
      }
    });
  }

  FutureOr<void> searchMovieEvent(
      SearchMovieEvent event, Emitter<SearchState> emit) async {
    final loadedmovies =
        await DiscoverMoviesService().fetchAllMovies(currentPage);
    if (event.query.isEmpty) {
      emit(SearchLoadedSuccessState(movies: loadedmovies));
      return;
    }
    final movies = await SearchMoviesService().fetchAllMovies(event.query);

    final filteredMovies = movies
        .where((movie) =>
            movie.title.toLowerCase().contains(event.query.toLowerCase()))
        .toList();

    if (filteredMovies.isEmpty) {
      emit(SearchLoadedSuccessState(movies: loadedmovies));
    } else {
      emit(SearchedMovieState(movies: filteredMovies));
    }
  }
}
