// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieDetailsController on _MovieDetailsControllerBase, Store {
  final _$stateAtom = Atom(name: '_MovieDetailsControllerBase.state');

  @override
  ControlState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ControlState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$similarMoviesAtom =
      Atom(name: '_MovieDetailsControllerBase.similarMovies');

  @override
  ObservableList<MovieSimilar> get similarMovies {
    _$similarMoviesAtom.reportRead();
    return super.similarMovies;
  }

  @override
  set similarMovies(ObservableList<MovieSimilar> value) {
    _$similarMoviesAtom.reportWrite(value, super.similarMovies, () {
      super.similarMovies = value;
    });
  }

  final _$movieDetailsAtom =
      Atom(name: '_MovieDetailsControllerBase.movieDetails');

  @override
  MovieDetails? get movieDetails {
    _$movieDetailsAtom.reportRead();
    return super.movieDetails;
  }

  @override
  set movieDetails(MovieDetails? value) {
    _$movieDetailsAtom.reportWrite(value, super.movieDetails, () {
      super.movieDetails = value;
    });
  }

  final _$videoPathAtom = Atom(name: '_MovieDetailsControllerBase.videoPath');

  @override
  String get videoPath {
    _$videoPathAtom.reportRead();
    return super.videoPath;
  }

  @override
  set videoPath(String value) {
    _$videoPathAtom.reportWrite(value, super.videoPath, () {
      super.videoPath = value;
    });
  }

  final _$_MovieDetailsControllerBaseActionController =
      ActionController(name: '_MovieDetailsControllerBase');

  @override
  void handleTapMovie({required int movieId}) {
    final _$actionInfo = _$_MovieDetailsControllerBaseActionController
        .startAction(name: '_MovieDetailsControllerBase.handleTapMovie');
    try {
      return super.handleTapMovie(movieId: movieId);
    } finally {
      _$_MovieDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
similarMovies: ${similarMovies},
movieDetails: ${movieDetails},
videoPath: ${videoPath}
    ''';
  }
}
