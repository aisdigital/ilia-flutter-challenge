import 'package:ilia_challenge/modules/core/infra/interfaces/int_response.dart';

abstract class IntHttpClient {
  Future<IntResponse> get({required String route});
  Future<IntResponse> post({required String route, required Map payload});
  Future<IntResponse> put({required String route, required Map payload});
  Future<IntResponse> delete({required String route});
}
