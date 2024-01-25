import 'package:ilia_challenge/core/interfaces/int_error.dart';

abstract class IntResponse {
  final Result result;
  final IntError? error;
  final Map<String, dynamic>? data;

  IntResponse({
    this.result = Result.waiting,
    this.error,
    this.data,
  });
}

enum Result { success, failed, waiting }
