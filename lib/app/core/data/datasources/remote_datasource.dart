abstract class RemoteDatasource {
  Future<dynamic> get({
    required String url,
    Map<String, dynamic> query,
    Map<String, String> headers,
  });

  Future<dynamic> post({
    required String url,
    required Map body,
    Map<String, dynamic> query,
    Map<String, String> headers,
  });

  Future<dynamic> put({
    required String url,
    required Map body,
    Map<String, dynamic> query,
    Map<String, String> headers,
  });

  Future<dynamic> patch({
    required String url,
    required Map body,
    Map<String, dynamic> query,
    Map<String, String> headers,
  });

  Future<dynamic> delete({
    required String url,
    Map<String, dynamic> query,
    Map<String, String> headers,
  });
}
