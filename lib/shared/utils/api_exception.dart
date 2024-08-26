import 'package:dio/dio.dart';

class ApiExeption {
  static String getExeptionMessage(DioException error) {
    switch (error.type) {
      case DioExceptionType.badResponse:
        return "Bad Response, Please try again";
      case DioExceptionType.sendTimeout:
        return "Send Timeout";
      case DioExceptionType.receiveTimeout:
        return "Receive Timeout";
      case DioExceptionType.connectionError:
        return "Connection Error, Please try again";
      case DioExceptionType.cancel:
        return "Request Cancelled";
      case DioExceptionType.connectionTimeout:
        return "Connection time out, check your connection";
      default:
        return "Something went wrong, unknown error";
    }
  }
}
