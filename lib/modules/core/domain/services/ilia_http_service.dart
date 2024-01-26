import 'package:ilia_challenge/modules/core/domain/interfaces/int_http_service.dart';
import 'package:ilia_challenge/modules/core/adapters/http_client_adapter.dart/dio_client_adapter.dart';
import 'package:ilia_challenge/modules/core/infra/interfaces/int_response.dart';
import 'package:ilia_challenge/modules/core/infra/services/models/errors.dart';
import 'package:ilia_challenge/modules/core/infra/services/models/ilia_response.dart';

class IliaHttpService implements IntHttpService {
  final datasource = DioClientAdapter();

  @override
  Future<(ServerError?, IntResponse)> get({
    required String route,
  }) async {
    try {
      final result = await datasource.get(route: route);

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
  Future<(ServerError?, IntResponse)> post({
    required String route,
    required Map payload,
  }) async {
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
  Future<(ServerError?, IntResponse)> put({
    required String route,
    required Map payload,
  }) async {
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
  Future<(ServerError?, IntResponse)> delete({
    required String route,
  }) async {
    try {
      final result = await datasource.delete(route: route);

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
