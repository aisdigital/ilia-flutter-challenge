enum MovieSection {
  nowPlaying,
  upcoming,
  discover,
  popular;

  String get path {
    return switch (this) {
      MovieSection.nowPlaying => '/movie/now_playing?',
      MovieSection.upcoming => '/movie/upcoming?',
      MovieSection.discover => '/discover/movie?',
      MovieSection.popular => '/movie/popular?',
    };
  }
}
