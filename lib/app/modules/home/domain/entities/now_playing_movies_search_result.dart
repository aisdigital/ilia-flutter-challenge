class NowPlayingMoviesSearchResult {
  final Map<String, dynamic> dates;
  final int page;
  final List<dynamic> results;
  final int totalPages;
  final int totalResults;

  NowPlayingMoviesSearchResult({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  const NowPlayingMoviesSearchResult.empty()
      : dates = const {},
        page = 0,
        results = const [],
        totalPages = 0,
        totalResults = 0;
}
