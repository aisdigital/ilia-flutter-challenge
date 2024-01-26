abstract class IntException implements Exception {
  final String message;
  final StackTrace? stack;

  IntException({required this.message, required this.stack});
}
