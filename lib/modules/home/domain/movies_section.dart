enum MovieSection {
  nowPlaying,
  upcoming,
  discover,
  popular,
  search;

  String get path {
    return switch (this) {
      MovieSection.nowPlaying => '/movie/now_playing?',
      MovieSection.upcoming => '/movie/upcoming?',
      MovieSection.discover => '/discover/movie?',
      MovieSection.popular => '/movie/popular?',
      MovieSection.search => '/search/movie?',
    };
  }
}
