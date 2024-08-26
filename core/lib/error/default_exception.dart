import 'base_exception.dart';

class DefaultException extends BaseException {
  const DefaultException({
    required super.message,
    super.statusCode,
    super.data,
    super.stackTracing,
  });
}
