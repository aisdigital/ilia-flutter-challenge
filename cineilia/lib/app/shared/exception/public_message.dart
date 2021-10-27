class PublicMessageException implements Exception {
  String message;
  dynamic previous;

  PublicMessageException(this.message, {this.previous});

  String toString() {
    return message;
  }
}