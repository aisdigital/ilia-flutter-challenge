import 'package:dio/dio.dart';
import 'package:ilia_challenge/core/infra/interfaces/int_http_client.dart';

import 'package:ilia_challenge/core/infra/services/config/config.dart';
import 'package:ilia_challenge/core/infra/services/models/exception_service.dart';

class DioClientAdapter implements IntHttpClient {
  //TODO: validar os status codes
  //criar outro client sem bearer ou adaptar este?
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
  Future<dynamic> get({required String route}) async {
    final dio = client();
    try {
      final response = await dio.get(route);

      return response.data;
    } on DioException catch (error, stack) {
      throw PluginException(
        message: '${error.message}',
        stack: stack,
      );
    } catch (error, stack) {
      throw ServerException(
        message: '$error',
        stack: stack,
      );
    } finally {
      dio.close();
    }
  }

  @override
  Future<dynamic> post({required String route, required Map payload}) async {
    final dio = client();

    try {
      final response = await dio.post(route, data: payload);

      return response.data;
    } on DioException catch (error, stack) {
      throw PluginException(
        message: '${error.message}',
        stack: stack,
      );
    } catch (error, stack) {
      throw ServerException(
        message: '$error',
        stack: stack,
      );
    } finally {
      dio.close();
    }
  }

  @override
  Future<dynamic> put({required String route, required Map payload}) async {
    final dio = client();

    try {
      final response = await dio.put(route, data: payload);

      return response.data;
    } on DioException catch (error, stack) {
      throw PluginException(
        message: '${error.message}',
        stack: stack,
      );
    } catch (error, stack) {
      throw ServerException(
        message: '$error',
        stack: stack,
      );
    } finally {
      dio.close();
    }
  }

  @override
  Future<dynamic> delete({required String route}) async {
    final dio = client();

    try {
      final response = await dio.delete(route);

      return response.data;
    } on DioException catch (error, stack) {
      throw PluginException(
        message: '${error.message}',
        stack: stack,
      );
    } catch (error, stack) {
      throw ServerException(
        message: '$error',
        stack: stack,
      );
    } finally {
      dio.close();
    }
  }
}
