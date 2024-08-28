import 'package:dio/dio.dart';
import '../models/api_error_model.dart';

String? extractErrorMessage(Exception? error) {
  try {
    return (error as DioException).response?.data['detail'];
  } catch (_) {
    return null;
  }
}

ApiErrorModel? extractErrorModel(Map<String, dynamic> json) {
  try {
    return ApiErrorModel.fromJson(json);
  } catch (_) {
    return null;
  }
}