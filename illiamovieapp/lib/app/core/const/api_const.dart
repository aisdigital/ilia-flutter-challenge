class ApiConst {
  static String get apiToken =>
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzN2M4Yjk0NWIyZjdhZWQwYjI0ODVkNjAzOTc4ZTdjNyIsInN1YiI6IjVmZjFmYzQwMWQzNTYzMDA0MTBkMDQ5MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.H29TchIvAeG1C8qEuTmjMGWGnv4CZ3NCX5RSVRDqqhE';
  static String get apiEndpoint => 'https://api.themoviedb.org/3/';
  static String get moviesInTheatre => '/movie/now_playing';
  static String imageApiUrl(String width) =>
      'https://image.tmdb.org/t/p/$width/';
}
