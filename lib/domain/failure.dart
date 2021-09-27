abstract class IFailure implements Exception {
  late String message;

  @override
  String toString() {
    return message;
  }
}

class Failure extends IFailure {
  Failure(String message) {
    this.message = message;
  }
}
