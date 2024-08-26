class MovieVideo {
  final String name;
  final String key;
  final String? iso6391;
  final String? iso31661;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final DateTime? publishedAt;
  final String? id;

  const MovieVideo({
    required this.name,
    required this.key,
    this.iso6391,
    this.iso31661,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });
}
