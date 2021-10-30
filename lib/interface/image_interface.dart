///a helper to grab images from TheMoviesDB's cdn
abstract class InterfaceImage {
  Future<String?> getMovieUrlCover(String path) async {}

  Future<String?> getMovieUrlPoster(String path) async {}
}
