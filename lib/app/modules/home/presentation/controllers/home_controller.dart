import 'package:flutter/material.dart';
import 'package:pixel_cinema/app/core/presentation/controllers/page_lifecycle_controller.dart';
import 'package:pixel_cinema/app/modules/home/domain/entities/movie_entity.dart';
import 'package:pixel_cinema/app/modules/home/domain/use_cases/fetch_movies_from_theatres_use_case.dart';
import 'package:pixel_cinema/app/modules/home/domain/use_cases/fetch_video_use_case.dart';
import 'package:pixel_cinema/app/modules/home/domain/use_cases/search_movies_use_case.dart';
import 'package:pixel_cinema/app/modules/home/presentation/stores/home_store.dart';

class HomeController extends PageLifeCycleController {
  HomeController({
    required this.store,
    required this.fetchMoviesFromTheatresUseCase,
    required this.fetchVideoUseCase,
    required this.searchMoviesUseCase,
  });

  @override
  final HomeStore store;
  final FetchMoviesFromTheatresUseCase fetchMoviesFromTheatresUseCase;
  final FetchVideoUseCase fetchVideoUseCase;
  final SearchMoviesUseCase searchMoviesUseCase;

  @override
  Future<void> onReady() async {
    await fetchMoviesFromTheatres();
  }

  Future<void> updateLocalMovies() async {
    store.movies = store.pages.expand((page) => page.movies).toList();
    final moviesToFetch = store.movies.where((movie) => movie.trailerKey == null).toList();
    for (final movie in moviesToFetch) {
      await fetchVideo(movie: movie);
    }
  }

  bool onScrollFetch(ScrollNotification scrollInfo) {
    if (!store.isLoading && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
      fetchMoviesFromTheatres(pageNumber: store.pages.last.page + 1);
    }
    return true;
  }

  Future<void> fetchMoviesFromTheatres({int? pageNumber}) async {
    try {
      store.loading();
      final page = pageNumber != null
          ? await fetchMoviesFromTheatresUseCase.call(pageNumber: pageNumber)
          : await fetchMoviesFromTheatresUseCase.call();

      store.pages.add(page);
      await updateLocalMovies();
      store.completed();
    } on Exception catch (e) {
      store.error = e;
    }
  }

  Future<void> fetchVideo({required MovieEntity movie}) async {
    try {
      store.loading();
      movie.trailerKey = await fetchVideoUseCase.call(movieId: movie.id);
      store.completed();
    } on Exception catch (e) {
      store.error = e;
    }
  }

  Future<void> searchMovies(String query) async {
    try {
      store.loading();
      final page = await searchMoviesUseCase.call(query: query.toLowerCase());
      store.searchResults = page.movies;
      final moviesToFetch = store.searchResults.where((movie) => movie.trailerKey == null).toList();
      for (final movie in moviesToFetch) {
        await fetchVideo(movie: movie);
      }
      store.completed();
    } on Exception catch (e) {
      store.error = e;
    }
  }
}
