class FPopularError implements Exception {
  String message;
  StackTrace trace;
  FPopularError(this.message,{this.trace,});
}
