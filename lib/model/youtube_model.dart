class MovieYoutubeModel {
  dynamic id;
  List<MovieYoutubeModelResults> results = [];

  MovieYoutubeModel({this.id, required this.results});

  MovieYoutubeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results.add(new MovieYoutubeModelResults.fromJson(v));
      });
    }
  }
}

class MovieYoutubeModelResults {
  dynamic iso6391;
  dynamic iso31661;
  dynamic name;
  dynamic key;
  dynamic publishedAt;
  dynamic site;
  dynamic size;
  dynamic type;
  dynamic official;
  dynamic id;

  MovieYoutubeModelResults(
      {this.iso6391,
      this.iso31661,
      this.name,
      this.key,
      this.publishedAt,
      this.site,
      this.size,
      this.type,
      this.official,
      this.id});

  MovieYoutubeModelResults.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    publishedAt = json['published_at'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    id = json['id'];
  }
}
