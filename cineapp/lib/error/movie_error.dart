abstract class MovieError implements Exception {
  late String message;

  @override
  String toString() {
    return message;
  }
}
