class FRatedError implements Exception {
  String message;
  StackTrace trace;
  FRatedError(this.message,{this.trace});
}
