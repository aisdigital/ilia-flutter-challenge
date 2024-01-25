import 'package:ilia_challenge/core/external/adapters/http_client.dart/dio.dart';
import 'package:ilia_challenge/core/interfaces/int_request.dart';
import 'package:ilia_challenge/core/interfaces/int_response.dart';
import 'package:ilia_challenge/core/services/models/errors.dart';
import 'package:ilia_challenge/core/services/models/ilia_response.dart';

class CarbonRequest implements IntRequest {
  CarbonRequest({required this.route});

  @override
  String route;

  final datasource = DioClient();

  @override
  Future<(ServerError?, IntResponse)> get() async {
    try {
      final result = await datasource.get(route);

      return (
        null,
        IliaResponse(
          result: Result.success,
          data: result.data ?? <String, dynamic>{},
        )
      );
    } catch (message, stack) {
      return (
        ServerError(message: 'message:$message n/ stack: $stack'),
        IliaResponse(result: Result.failed, data: {})
      );
    }
  }

  @override
  Future<(ServerError?, IntResponse)> post({required Map payload}) async {
    try {
      final result = await datasource.post(
        route: route,
        payload: payload,
      );

      return (
        null,
        IliaResponse(
          result: Result.success,
          data: result.data ?? <String, dynamic>{},
        )
      );
    } catch (message, stack) {
      return (
        ServerError(message: 'message:$message n/ stack: $stack'),
        IliaResponse(result: Result.failed, data: {})
      );
    }
  }

  @override
  Future<(ServerError?, IntResponse)> put({required Map payload}) async {
    try {
      final result = await datasource.put(
        route: route,
        payload: payload,
      );

      return (
        null,
        IliaResponse(
          result: Result.success,
          data: result.data ?? <String, dynamic>{},
        )
      );
    } catch (message, stack) {
      return (
        ServerError(message: 'message:$message n/ stack: $stack'),
        IliaResponse(result: Result.failed, data: {})
      );
    }
  }

  @override
  Future<(ServerError?, IntResponse)> delete() async {
    try {
      final result = await datasource.delete(route);

      return (
        null,
        IliaResponse(
          result: Result.success,
          data: result.data ?? <String, dynamic>{},
        )
      );
    } catch (message, stack) {
      return (
        ServerError(message: 'message:$message n/ stack: $stack'),
        IliaResponse(result: Result.failed, data: {})
      );
    }
  }
}
