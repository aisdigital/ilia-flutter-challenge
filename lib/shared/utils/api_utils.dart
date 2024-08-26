class ApiUtils {
  static String NOW_PLAYING(int page) => "/movie/now_playing?page=$page";
  static String FETCH_IMAGE(String path) =>
      "http://image.tmdb.org/t/p/w500/$path";
}
