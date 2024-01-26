part of 'movie_cubit.dart';

class MovieState extends Equatable {
  final Map movie;
  const MovieState({
    this.movie = const {},
  });

  @override
  List<Object> get props => [movie];

  MovieState copyWith({
    Map? movie,
  }) {
    return MovieState(
      movie: movie ?? this.movie,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'movie': movie,
    };
  }

  factory MovieState.fromMap(Map<String, dynamic> map) {
    return MovieState(
      movie: Map.from(map['movie']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieState.fromJson(String source) =>
      MovieState.fromMap(json.decode(source));

  @override
  String toString() => 'MovieState(movie: $movie)';
}
