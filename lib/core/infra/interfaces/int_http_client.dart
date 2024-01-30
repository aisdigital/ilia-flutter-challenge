abstract class IntHttpClient {
  Future<dynamic> get({required String route});
  Future<dynamic> post({required String route, required Map payload});
  Future<dynamic> put({required String route, required Map payload});
  Future<dynamic> delete({required String route});
}
