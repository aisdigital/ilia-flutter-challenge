import 'package:either_dart/either.dart';

import '../error/default_exception.dart';
import '../type/output.dart';

class HttpResponse<T> {
  final Output<T> result;

  HttpResponse.success(T data, {required int this.statusCode}) : result = Right(data);

  HttpResponse.error(DefaultException exception)
      : result = Left(exception),
        statusCode = exception.statusCode;

  final int? statusCode;

  bool get isSuccess => result.isRight;

  T? get data => result.fold((l) => null, (r) => r);

  String? get errorMessage => result.fold((l) => l.message, (_) => null);
}
