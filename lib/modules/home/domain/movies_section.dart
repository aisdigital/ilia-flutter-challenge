enum MovieSection {
  nowPlaying,
  upcoming,
  discover,
  popular,
  details,
  search,
  config,
  media;

  String get path {
    return switch (this) {
      MovieSection.nowPlaying => '/3/movie/now_playing?',
      MovieSection.upcoming => '/3/movie/upcoming?',
      MovieSection.discover => '/3/discover/movie?',
      MovieSection.popular => '/3/movie/popular?',
      MovieSection.details => '/3/movie/:id?',
      MovieSection.search => '/3/search/movie?',
      MovieSection.config => '/3/configuration',
      MovieSection.media => '/t/p',
    };
  }
}
