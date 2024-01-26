import 'package:ilia_challenge/modules/core/domain/interfaces/int_error.dart';
import 'package:ilia_challenge/modules/core/domain/interfaces/int_response.dart';
import 'package:ilia_challenge/modules/core/external/http_client_adapter.dart/dio.dart';
import 'package:ilia_challenge/modules/core/infra/interfaces/int_http_client.dart';
import 'package:ilia_challenge/modules/core/infra/models/errors.dart';

class HttpHandlerService {
  final IntHttpClient client = DioClient();

  Future<(IntError?, IntResponse?)> get({required String route}) async {
    try {
      final response = await client.get(route);
      return (null, response);
    } catch (error) {
      return (ServerError(), null);
    }
  }

  Future<(IntError?, IntResponse?)> post(
      {required String route, required Map payload}) async {
    try {
      final response = await client.post(route: route, payload: payload);
      return (null, response);
    } catch (error) {
      return (ServerError(), null);
    }
  }

  Future<(IntError?, IntResponse?)> put(
      {required String route, required Map payload}) async {
    try {
      final response = await client.put(route: route, payload: payload);
      return (null, response);
    } catch (error) {
      return (ServerError(), null);
    }
  }

  Future<(IntError?, IntResponse?)> delete({required String route}) async {
    try {
      final response = await client.delete(route);
      return (null, response);
    } catch (error) {
      return (ServerError(), null);
    }
  }
}
