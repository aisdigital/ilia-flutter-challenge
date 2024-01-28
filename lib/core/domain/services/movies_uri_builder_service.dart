import 'package:flutter/material.dart';
import 'package:ilia_challenge/core/cubit/challenge_core.dart';
import 'package:ilia_challenge/core/infra/services/config/config.dart';
import 'package:ilia_challenge/main.dart';

class MoviesUriBuilderService {
  ChallengeCore get core => injector.find<ChallengeCore>();

  MoviesUriBuilderService();

  /////////// URI BUILDER FOR MOVIES LISTS (HOME) /////////////

// _page = 0 is set after last page in nextPage() validation;
  String? get uriMovies => _page > 0
      ? Config.tmdbBaseUrl + _path + _parameters + setLanguage() + setPage()
      : null;

  String _path = '';
  String _parameters = '';
  int lastPage = 0;
  int _page = 1;

  void setPath({required String path}) {
    _path = path;
  }

  void addParameter({required String name, required String value}) {
    _parameters = '$_parameters$name=$value&';
  }

  String setLanguage() {
    const Locale port = Locale('pt', 'BR');
    // const Locale eng = Locale('en', 'US');

    Locale locale = core.value.locale;
    String language = 'language=pt-BR';

    switch (locale) {
      case port:
        language = 'language=pt-BR';
        break;
      default:
        language = 'language=en-US';
        break;
    }

    return language;
  }

  String setPage({int? jumpToPage}) {
    return 'page=${jumpToPage ?? _page}';
  }

  bool handleLastPage({int? last}) {
    // set last page if we pass the parameter
    if (last != null) lastPage = last;
    // return true until _page reaches _lastPage,
    // after that last page is set to 0 (false)
    return _page <= lastPage && _page != 0;
  }

  void nextPage() {
    if (handleLastPage()) {
      _page++;
      // prevents _page to run after _lastPage
      if (!handleLastPage()) _page = 0;
    }
  }
  ////////////////////////////////////////////////////////////////////////
  /////////// URI BUILDER FOR MOVIEL DETAILS (MOVIE) /////////////

  String get uriDetails =>
      Config.tmdbBaseUrl + _path + setLanguage() + append();

  String _append = '';

  String append({List values = const []}) {
    if (values.isNotEmpty) _append = '&append_to_response=${values.join(',')}';
    return _append;
  }

  ////////////////////////////////////////////////////////////////////////
  /////////// URI BUILDER FOR MOVIEL DETAILS (MOVIE) /////////////
  ///
  String get uriConfig => Config.tmdbBaseUrl + _path;
}
