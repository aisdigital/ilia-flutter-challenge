enum MovieSection {
  nowPlaying,
  upcoming,
  discover,
  popular,
  details,
  search;

  String get path {
    return switch (this) {
      MovieSection.nowPlaying => '/movie/now_playing?',
      MovieSection.upcoming => '/movie/upcoming?',
      MovieSection.discover => '/discover/movie?',
      MovieSection.popular => '/movie/popular?',
      MovieSection.details => '/movie/:id?',
      MovieSection.search => '/search/movie?',
    };
  }
}
