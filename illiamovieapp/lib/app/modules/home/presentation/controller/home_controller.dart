import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/domain/enums/control_state_enum.dart';
import '../../../../core/utils/extensions/screen_extension.dart';
import '../../../../core/utils/extensions/string_extension.dart';
import '../../../../core/utils/debouncer_utils.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/usecases/get_movies_in_theatre_usecase.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetMoviesInTheatreUseCase _getMoviesInTheatreUseCase;

  _HomeControllerBase(
      {required GetMoviesInTheatreUseCase getMoviesInTheatreUseCase})
      : _getMoviesInTheatreUseCase = getMoviesInTheatreUseCase {
    _listenSearchInput();
    _listenScrollController();
    pipeline();
  }

  final ScrollController scrollController = ScrollController();
  final ScrollController listPosterController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final Debouncer debouncerSearch = Debouncer();

  @observable
  ControlState state = ControlState.start;
  @observable
  String stateMessage = '';
  @observable
  bool _hasFocusSearch = false;
  @observable
  int page = 1;
  @observable
  bool _isVisibleKeyboard = false;
  @observable
  String searchText = '';
  @observable
  ObservableList<Movie> listMovies = <Movie>[].asObservable();

  @computed
  bool get isSearching =>
      searchText.isNotEmpty || _hasFocusSearch || _isVisibleKeyboard;

  @computed
  List<Movie> get top10Movies => List.generate(10, (i) => listMovies[i]);

  @computed
  List<Movie> get movies {
    List<Movie> outputList = List<Movie>.from(listMovies);

    return _searchFromList(outputList);
  }

  @action
  _setState(
    ControlState state, {
    String? message,
  }) {
    this.state = state;
    stateMessage = message ?? '';
  }

  @action
  void setIsVisibleKeyboard(bool value) => _isVisibleKeyboard = value;

  @action
  void handleTapMovie({required int movieId}) {}

  @action
  void setSearchText(String value) {
    searchController.value = TextEditingValue(
      text: value,
      selection: TextSelection(
        extentOffset: searchController.text.length,
        baseOffset: searchController.text.length,
      ),
    );
    searchText = value;
  }

  @action
  void handleClearSearch() {
    searchFocusNode.unfocus();
    searchText = '';
    searchController.clear();
  }

  Future<void> pipeline() async {
    try {
      state = ControlState.loading;
      listMovies = (await _getMovies()).asObservable();
      _setState(ControlState.sucess);
    } catch (e) {
      _setState(
        ControlState.failure,
        message: '⚠\nOops... aconteceu um erro',
      );
    }
  }

  List<Movie> _searchFromList(List<Movie> movies) {
    if (searchController.text.isNotEmpty && movies.isNotEmpty) {
      return movies
          .where((movie) {
            String movieSearch = movie.title;
            movieSearch = movieSearch.trim();
            movieSearch = movieSearch.toLowerCase();
            movieSearch = movieSearch.removeDiacritics();

            String searchText = this.searchText;

            searchText = searchText.trim();
            searchText = searchText.toLowerCase();
            searchText = searchText.removeDiacritics();

            return movieSearch.contains(searchText);
          })
          .toList()
          .asObservable();
    } else {
      return movies;
    }
  }

  Future<void> _getNextPage() async {
    page++;
    final List<Movie> newList = await _getMovies();
    listMovies = newList.asObservable();
  }

  Future<List<Movie>> _getMovies() async {
    final failureOrMovies = await _getMoviesInTheatreUseCase(
      ParamsGetMoviesInTheatre(page: page),
    );

    return failureOrMovies.fold(
      (failure) => throw failure,
      (movies) => movies,
    );
  }

  bool onNotificationSnapEffect(ScrollNotification scrollNotification) {
    if (scrollNotification is ScrollEndNotification) {
      final double maxExtent = 400.scale;
      if (scrollNotification.metrics.pixels <= maxExtent) {
        if (scrollNotification.metrics.pixels >= maxExtent / 2.5) {
          Future.delayed(Duration.zero, () {
            scrollController.animateTo(
              280.scale.clamp(0.0, scrollNotification.metrics.maxScrollExtent),
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          });
        }
      }
    } else if (scrollNotification is ScrollUpdateNotification) {}
    return true;
  }

  void _listenSearchInput() {
    searchFocusNode.addListener(() {
      _hasFocusSearch = searchFocusNode.hasFocus;
    });
  }

  void _listenScrollController() {
    scrollController.addListener(() async {
      if (scrollController.positions.first.pixels >=
          scrollController.positions.first.maxScrollExtent) {
        await _getNextPage();
      }
    });
  }
}
