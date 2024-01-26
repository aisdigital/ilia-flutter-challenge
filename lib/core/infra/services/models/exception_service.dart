class ServerException implements Exception {
  final String message;
  final StackTrace? stack;

  ServerException({required this.message, required this.stack});
}

class PluginException implements Exception {
  final String message;
  final StackTrace? stack;

  PluginException({required this.message, required this.stack});
}
