import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ilia_challenge/core/cubit/challenge_core.dart';
import 'package:ilia_challenge/core/domain/services/movies_uri_builder_service.dart';
import 'package:ilia_challenge/core/infra/services/config/config.dart';
import 'package:ilia_challenge/main.dart';
import 'package:ilia_challenge/modules/home/domain/home_repository.dart';
import 'package:ilia_challenge/modules/home/domain/movies_section.dart';

export 'package:ilia_challenge/modules/home/domain/movies_section.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository repo = injector.find<HomeRepository>();
  HomeBloc() : super(HomeState()) {
    on<HomeEvent>(
      (events, emit) async => events.map(
        started: (event) => _homeStarted(event, emit),
        loadMovies: (event) => _loadMovies(event, emit),
        nextPageRequested: (event) => _nextPageRequested(event, emit),
        switchSection: (event) => _switchSection(event, emit),
        searchMovies: (event) => _searchMovies(event, emit),
        loadMovieDetails: (event) => _loadMovieDetails(event, emit),
      ),
    );
  }

  _homeStarted(_HomeStarted event, emit) async {
    emit(state.copyWith(
        loaders: switchLoaders(loaders: state.loaders, key: 'initialLoader')));

    var (sections, movies) = _resetMoviesLists();

    emit(state.copyWith(
      movies: movies,
      sections: sections,
    ));
    final result = Completer<Map<MovieSection, List<dynamic>>>();

    add(HomeEvent.loadMovies(section: state.currentSection, result: result));

    movies = await result.future;

    emit(state.copyWith(movies: movies));
  }

  _loadMovies(_LoadMovies event, emit) async {
    MoviesUriBuilderService uriService = state.sections[event.section]!;

    // uri is set to null when reaches last page
    if (uriService.uriMoviesList == null) return;

    var (error, response) =
        await repo.loadMovies(route: uriService.uriMoviesList!);

    /// TODO: handle incoming errors instead of return only
    if (error != null) {
      event.result.complete(null);
      return;
    } else {
      if (uriService.lastPage == 0) {
        // set last page in the first request
        uriService.handleLastPage(last: response?.data['total_pages'] ?? 1);
      }
      print('wich page? ${uriService.uriMoviesList}');

      event.result.complete(handleResult(
          section: event.section, results: response?.data['results'] ?? []));
    }

    emit(state.copyWith(loaders: {}));
  }

  Future _nextPageRequested(_NextPageRequested event, emit) async {
    emit(state.copyWith(
        loaders: switchLoaders(loaders: state.loaders, key: 'nextPageLoader')));

    final newSection =
        Map<MovieSection, MoviesUriBuilderService>.from(state.sections);

    final newUriBuilder = state.sections[event.section]!..nextPage();

    newSection[event.section] = newUriBuilder;

    print(newUriBuilder.uriMoviesList);

    emit(state.copyWith(sections: newSection));

    final result = Completer<Map<MovieSection, List<dynamic>>>();

    add(HomeEvent.loadMovies(section: state.currentSection, result: result));

    final movies = await result.future;

    emit(state.copyWith(movies: movies));
    event.success();
  }

  (Map<MovieSection, MoviesUriBuilderService>, Map<MovieSection, List>)
      _resetMoviesLists() {
    Map<MovieSection, MoviesUriBuilderService> sections = {};
    Map<MovieSection, List> movies = {};

    for (var element in MovieSection.values) {
      sections[element] = MoviesUriBuilderService()
        ..setPath(path: element.path);
      movies[element] = [];
    }

    return (sections, movies);
  }

  switchLoaders({required Map loaders, required String key}) {
    final newState = Map<String, bool>.from(loaders);
    bool loader = loaders[key] ?? false;
    newState[key] = !loader;
    return newState;
  }

  Map<MovieSection, List<dynamic>> handleResult(
      {required MovieSection section, required List results}) {
    // aggregates incoming movies to the current state
    Map<MovieSection, List<dynamic>> movies = Map.from(state.movies);
    List currentSection = List.from(movies[section] ?? []);
    currentSection.addAll(List.from(results));
    movies[section] = currentSection;
    return movies;
    //////////////////////////////
  }

  void _switchSection(_SwitchSection event, emit) async {
    var (sections, movies) = _resetMoviesLists();

    emit(state.copyWith(
      movies: movies,
      sections: sections,
    ));

    emit(state.copyWith(currentSection: event.section));
    final Completer<Map<MovieSection, List<dynamic>>> completer = Completer();
    add(HomeEvent.loadMovies(section: event.section, result: completer));
    movies = await completer.future;
    emit(state.copyWith(movies: movies));
  }

  void _searchMovies(_SearchMovies event, emit) async {
    var (sections, movies) = _resetMoviesLists();

    emit(state.copyWith(
      movies: movies,
      sections: sections,
    ));

    final uriBuilder = state.sections[MovieSection.search]!;
    uriBuilder
      ..addParameter(name: 'query', value: event.query)
      ..addParameter(name: 'include_adult', value: 'false');

    emit(state.copyWith(currentSection: MovieSection.search));
    final Completer<Map<MovieSection, List<dynamic>>> completer = Completer();
    add(HomeEvent.loadMovies(section: MovieSection.search, result: completer));
    movies = await completer.future;
    emit(state.copyWith(movies: movies));
  }

  _loadMovieDetails(_LoadMovieDetails event, emit) async {
    final movieUri = MoviesUriBuilderService()
      ..setPath(
          path: MovieSection.details.path
              .replaceAll(':id?', '${event.movieId}?'));

    final videosUri = MoviesUriBuilderService()
      ..setPath(
          path: MovieSection.details.path
              .replaceAll(':id?', '${event.movieId}/videos?'));

    final imagesUri = MoviesUriBuilderService()
      ..setPath(
          path: MovieSection.details.path
              .replaceAll(':id?', '${event.movieId}/images?'));

    final (movieError, movie) =
        await repo.loadMovies(route: movieUri.uriMovieDetails);
    final (videoError, videos) =
        await repo.loadMovies(route: videosUri.uriConfig);
    final (imageError, images) =
        await repo.loadMovies(route: imagesUri.uriConfig);

    final Map<String, dynamic> data = {};

    if (movieError != null) {
      event.success.complete(null);
    } else {
      if (videos != null) data['videos'] = videos.data['results'];
      if (images != null) data['images'] = images.data;

      data.addAll(movie?.data ?? {});

      event.success.complete(data);
    }
  }

  getImageUri({String? poster, String? backdrop}) {
    if (poster == null && backdrop == null) return ('', '');
    final ChallengeCore core = injector.find<ChallengeCore>();

    const apiBaseUrl = Config.imageApi;

    final path = MovieSection.media.path;

    final posterSizes = core.value.mediaConfig?.posterSizes ?? [];

    int? posterMiddle =
        posterSizes.length > 2 ? (posterSizes.length / 2).ceil() : null;

    final posterSize = posterMiddle != null ? posterSizes[posterMiddle] : null;

    final backdropSizes = core.value.mediaConfig?.backdropSizes ?? [];

    int? backMiddle = backdropSizes.length - 1;

    final backSize = posterSizes[backMiddle];

    return (
      '$apiBaseUrl$path/$posterSize/$poster}',
      '$apiBaseUrl$path/$backSize/$backdrop}'
    );
  }
}
