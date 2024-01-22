class AppUrls {
  static String get posterMoviesBaseUrl => 'https://image.tmdb.org/t/p/w500/';
  static String get nullPosterMoviesImage =>
      'https://danbistore.com/wp-content/uploads/2023/03/Square-Placeholder.jpg';

  static String movieVideoUrl(String videoId) =>
      'https://www.youtube.com/watch?v=$videoId';
}
