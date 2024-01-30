part of 'movie_cubit.dart';

class MovieState extends Equatable {
  final Movie movie;
  const MovieState({
    required this.movie,
  });

  @override
  List<Object> get props => [movie];

  MovieState copyWith({
    Movie? movie,
  }) {
    return MovieState(
      movie: movie ?? this.movie,
    );
  }
}
