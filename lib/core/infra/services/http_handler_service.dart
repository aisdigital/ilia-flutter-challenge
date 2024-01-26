import 'package:ilia_challenge/core/domain/interfaces/int_http_service.dart';
import 'package:ilia_challenge/core/infra/services/adapters/http_client_adapter.dart/dio_client_adapter.dart';
import 'package:ilia_challenge/core/domain/interfaces/int_response.dart';
import 'package:ilia_challenge/core/infra/services/models/error_models.dart';
import 'package:ilia_challenge/core/infra/services/models/ilis_response_model.dart';

class HttpHandlerService implements IntHttpService {
  final datasource = DioClientAdapter();

  @override
  Future<(ServerError?, IntResponse?)> get({required String route}) async {
    try {
      final result = await datasource.get(route: route);

      return (
        null,
        IliaResponseModel(data: result),
      );
    } catch (message, stack) {
      return (
        ServerError(message: 'message:$message n/ stack: $stack'),
        null,
      );
    }
  }

  @override
  Future<(ServerError?, IntResponse?)> post(
      {required String route, required Map payload}) async {
    try {
      final result = await datasource.post(route: route, payload: payload);

      return (
        null,
        IliaResponseModel(data: result),
      );
    } catch (message, stack) {
      return (
        ServerError(message: 'message:$message n/ stack: $stack'),
        null,
      );
    }
  }

  @override
  Future<(ServerError?, IntResponse?)> put(
      {required String route, required Map payload}) async {
    try {
      final result = await datasource.put(route: route, payload: payload);

      return (
        null,
        IliaResponseModel(data: result),
      );
    } catch (message, stack) {
      return (
        ServerError(message: 'message:$message n/ stack: $stack'),
        null,
      );
    }
  }

  @override
  Future<(ServerError?, IntResponse?)> delete({required String route}) async {
    try {
      final result = await datasource.delete(route: route);

      return (
        null,
        IliaResponseModel(data: result),
      );
    } catch (message, stack) {
      return (
        ServerError(message: 'message:$message n/ stack: $stack'),
        null,
      );
    }
  }
}
