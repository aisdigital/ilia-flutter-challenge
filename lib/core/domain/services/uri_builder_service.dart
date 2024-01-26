import 'package:ilia_challenge/core/infra/services/config/config.dart';

class UriBuilderService {
  UriBuilderService({required this.path});

  final String path;

  String get uri => Config.tmdbBaseUrl + path + queries + language + page;

  String queries = '';
  String language = '';
  String page = '';

  addParameter({required String name, required String value}) {}
  setLanguage() {}
  setPage() {}
}
