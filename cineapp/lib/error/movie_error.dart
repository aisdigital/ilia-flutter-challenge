abstract class MovieError implements Exception {
  String? message;

  @override
  String toString() {
    return message ?? '';
  }
}
