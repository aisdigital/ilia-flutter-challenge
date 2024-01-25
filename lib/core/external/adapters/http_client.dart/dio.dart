import 'package:dio/dio.dart';
import 'package:ilia_challenge/core/interfaces/int_http_client.dart';
import 'package:ilia_challenge/core/interfaces/int_response.dart';
import 'package:ilia_challenge/core/services/models/ilia_exception.dart';
import 'package:ilia_challenge/core/services/models/ilia_response.dart';

class DioClient implements IntHttpClient {
  final _dio = Dio();

  @override
  Future<IntResponse> get(String route) async {
    try {
      final response = await _dio.get(route);

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
    }
  }

  @override
  Future<IntResponse> post(
      {required String route, required Map payload}) async {
    try {
      final response = await _dio.post(route, data: payload);

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
    }
  }

  @override
  Future<IntResponse> put({required String route, required Map payload}) async {
    try {
      final response = await _dio.put(route, data: payload);

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
    }
  }

  @override
  Future<IntResponse> delete(String route) async {
    try {
      final response = await _dio.delete(route);

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
    }
  }
}
