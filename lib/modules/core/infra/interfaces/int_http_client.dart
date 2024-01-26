import 'package:ilia_challenge/modules/core/domain/interfaces/int_response.dart';

abstract class IntHttpClient {
  Future<IntResponse> get(String route);
  Future<IntResponse> post({required String route, required Map payload});
  Future<IntResponse> put({required String route, required Map payload});
  Future<IntResponse> delete(String route);
}
