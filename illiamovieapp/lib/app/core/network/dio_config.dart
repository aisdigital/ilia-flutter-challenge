import 'package:dio/dio.dart';

import '../const/api_const.dart';

class DioConfig {
  final Dio _client;
  final String _endpoint;

  DioConfig({
    required Dio client,
    required String endpoint,
  })  : _client = client,
        _endpoint = endpoint;

  void init() {
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: Duration(minutes: 1).inMilliseconds,
      baseUrl: _endpoint,
      headers: {'Authorization': 'Bearer ${ApiConst.apiToken}'},
    );

    _client.options = baseOptions;
  }
}
