import 'package:dio/dio.dart';
import 'package:ilia_challenge/modules/core/infra/interfaces/int_http_client.dart';

import 'package:ilia_challenge/modules/core/infra/services/config/config.dart';
import 'package:ilia_challenge/modules/core/infra/interfaces/int_response.dart';
import 'package:ilia_challenge/modules/core/infra/services/models/ilia_exception.dart';
import 'package:ilia_challenge/modules/core/infra/services/models/ilia_response.dart';

class DioClientAdapter implements IntHttpClient {
  Dio client() {
    return Dio(
      BaseOptions(
          baseUrl: Config.tmdbBaseUrl,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
          sendTimeout: const Duration(seconds: 5),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${Config.bearerToken}",
          }),
    );
  }

  @override
  Future<IntResponse> get({required String route}) async {
    final dio = client();
    try {
      final response = await dio.get(route);

      return IliaResponse(
        result: Result.success,
        data: response.data,
      );
    } on ServerException catch (error, stack) {
      throw ServerException(
        message: error.message.toString(),
        stack: stack,
      );
    } catch (error, stack) {
      throw ServerException(
        message: error.toString(),
        stack: stack,
      );
    } finally {
      dio.close();
    }
  }

  @override
  Future<IntResponse> post(
      {required String route, required Map payload}) async {
    final dio = client();

    try {
      final response = await dio.post(route, data: payload);

      return IliaResponse(
        result: Result.success,
        data: response.data,
      );
    } on ServerException catch (error, stack) {
      throw ServerException(
        message: error.message.toString(),
        stack: stack,
      );
    } catch (error, stack) {
      throw ServerException(
        message: error.toString(),
        stack: stack,
      );
    } finally {
      dio.close();
    }
  }

  @override
  Future<IntResponse> put({required String route, required Map payload}) async {
    final dio = client();

    try {
      final response = await dio.put(route, data: payload);

      return IliaResponse(
        result: Result.success,
        data: response.data,
      );
    } on ServerException catch (error, stack) {
      throw ServerException(
        message: error.message.toString(),
        stack: stack,
      );
    } catch (error, stack) {
      throw ServerException(
        message: error.toString(),
        stack: stack,
      );
    } finally {
      dio.close();
    }
  }

  @override
  Future<IntResponse> delete({required String route}) async {
    final dio = client();

    try {
      final response = await dio.delete(route);

      return IliaResponse(
        result: Result.success,
        data: response.data,
      );
    } on ServerException catch (error, stack) {
      throw ServerException(
        message: error.message.toString(),
        stack: stack,
      );
    } catch (error, stack) {
      throw ServerException(
        message: error.toString(),
        stack: stack,
      );
    } finally {
      dio.close();
    }
  }
}
