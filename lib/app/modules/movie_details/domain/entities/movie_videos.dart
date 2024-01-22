class MovieVideos {
  final int? id;
  final List<dynamic>? results;

  MovieVideos({
    this.id,
    this.results,
  });

  const MovieVideos.empty()
      : id = 0,
        results = const [];
}
