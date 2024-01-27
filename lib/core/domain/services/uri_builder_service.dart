import 'package:ilia_challenge/core/cubit/challenge_core.dart';
import 'package:ilia_challenge/core/infra/services/config/config.dart';
import 'package:ilia_challenge/main.dart';

class UriBuilderService {
  ChallengeCore get core => injector.find<ChallengeCore>();

  UriBuilderService({required this.path});

  final String path;

  String get uri =>
      Config.tmdbBaseUrl + path + setLanguage() + parameters + setPage();

  String parameters = '';
  int page = 1;

  void addParameter({required String name, required String value}) {
    parameters = '$parameters + $name=$value&';
  }

  String setLanguage() {
    return '${core.value.language}&';
  }

  String setPage() {
    return 'page=$page';
  }

  void nextPage() {
    page++;
  }
}
