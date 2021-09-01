// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<bool>? _$isSearchingComputed;

  @override
  bool get isSearching =>
      (_$isSearchingComputed ??= Computed<bool>(() => super.isSearching,
              name: '_HomeControllerBase.isSearching'))
          .value;
  Computed<List<Movie>>? _$top10MoviesComputed;

  @override
  List<Movie> get top10Movies =>
      (_$top10MoviesComputed ??= Computed<List<Movie>>(() => super.top10Movies,
              name: '_HomeControllerBase.top10Movies'))
          .value;
  Computed<List<Movie>>? _$moviesComputed;

  @override
  List<Movie> get movies =>
      (_$moviesComputed ??= Computed<List<Movie>>(() => super.movies,
              name: '_HomeControllerBase.movies'))
          .value;

  final _$stateAtom = Atom(name: '_HomeControllerBase.state');

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

  final _$stateMessageAtom = Atom(name: '_HomeControllerBase.stateMessage');

  @override
  String get stateMessage {
    _$stateMessageAtom.reportRead();
    return super.stateMessage;
  }

  @override
  set stateMessage(String value) {
    _$stateMessageAtom.reportWrite(value, super.stateMessage, () {
      super.stateMessage = value;
    });
  }

  final _$_hasFocusSearchAtom =
      Atom(name: '_HomeControllerBase._hasFocusSearch');

  @override
  bool get _hasFocusSearch {
    _$_hasFocusSearchAtom.reportRead();
    return super._hasFocusSearch;
  }

  @override
  set _hasFocusSearch(bool value) {
    _$_hasFocusSearchAtom.reportWrite(value, super._hasFocusSearch, () {
      super._hasFocusSearch = value;
    });
  }

  final _$pageAtom = Atom(name: '_HomeControllerBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$_isVisibleKeyboardAtom =
      Atom(name: '_HomeControllerBase._isVisibleKeyboard');

  @override
  bool get _isVisibleKeyboard {
    _$_isVisibleKeyboardAtom.reportRead();
    return super._isVisibleKeyboard;
  }

  @override
  set _isVisibleKeyboard(bool value) {
    _$_isVisibleKeyboardAtom.reportWrite(value, super._isVisibleKeyboard, () {
      super._isVisibleKeyboard = value;
    });
  }

  final _$searchTextAtom = Atom(name: '_HomeControllerBase.searchText');

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  final _$listMoviesAtom = Atom(name: '_HomeControllerBase.listMovies');

  @override
  ObservableList<Movie> get listMovies {
    _$listMoviesAtom.reportRead();
    return super.listMovies;
  }

  @override
  set listMovies(ObservableList<Movie> value) {
    _$listMoviesAtom.reportWrite(value, super.listMovies, () {
      super.listMovies = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic _setState(ControlState state, {String? message}) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase._setState');
    try {
      return super._setState(state, message: message);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsVisibleKeyboard(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIsVisibleKeyboard');
    try {
      return super.setIsVisibleKeyboard(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleTapMovie({required int movieId}) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.handleTapMovie');
    try {
      return super.handleTapMovie(movieId: movieId);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleClearSearch() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.handleClearSearch');
    try {
      return super.handleClearSearch();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
stateMessage: ${stateMessage},
page: ${page},
searchText: ${searchText},
listMovies: ${listMovies},
isSearching: ${isSearching},
top10Movies: ${top10Movies},
movies: ${movies}
    ''';
  }
}
