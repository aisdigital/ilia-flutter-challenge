import 'package:ilia_challenge/core/cubit/challenge_core.dart';
import 'package:ilia_challenge/core/infra/services/config/config.dart';
import 'package:ilia_challenge/main.dart';

class MoviesUriBuilderService {
  ChallengeCore get core => injector.find<ChallengeCore>();

  MoviesUriBuilderService({required this.path});

  final String path;

// _page = 0 is set after last page in nextPage() validation;
  String? get uri => _page > 0
      ? Config.tmdbBaseUrl + path + setLanguage() + _parameters + setPage()
      : null;

  String _parameters = '';
  int lastPage = 0;
  int _page = 1;

  void addParameter({required String name, required String value}) {
    _parameters = '$_parameters + $name=$value&';
  }

  String setLanguage() {
    return '${core.value.language}&';
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
}
