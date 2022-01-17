class SearchFilmesError implements Exception {
  String message;
  StackTrace stackTrace;
  SearchFilmesError(this.message,{this.stackTrace});
}