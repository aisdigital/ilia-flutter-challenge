part of 'movie_details_store.dart';

abstract class MovieDetailsStateIliaflix extends Equatable {
  const MovieDetailsStateIliaflix();
}

class InitialMovieDetailsState extends MovieDetailsStateIliaflix {
  const InitialMovieDetailsState();

  @override
  List<Object?> get props => [];
}

class LoadingMovieDetailsState extends MovieDetailsStateIliaflix {
  const LoadingMovieDetailsState();

  @override
  List<Object?> get props => [];
}

class SuccessMovieDetailsState extends MovieDetailsStateIliaflix {
  const SuccessMovieDetailsState();

  @override
  List<Object?> get props => [];
}

class FailureMovieDetailsState extends MovieDetailsStateIliaflix {
  const FailureMovieDetailsState();

  @override
  List<Object?> get props => [];
}

class MovieDetailsState extends Equatable {
  final MovieDetailsStateIliaflix state;
  final MovieDetails movieDetails;
  final MovieVideos movieVideos;

  const MovieDetailsState({
    this.state = const InitialMovieDetailsState(),
    this.movieDetails = const MovieDetails.empty(),
    this.movieVideos = const MovieVideos.empty(),
  });

  MovieDetailsState copyWith({
    MovieDetailsStateIliaflix? state,
    MovieDetails? movieDetails,
    MovieVideos? movieVideos,
  }) {
    return MovieDetailsState(
      state: state ?? this.state,
      movieDetails: movieDetails ?? this.movieDetails,
      movieVideos: movieVideos ?? this.movieVideos,
    );
  }

  @override
  List<Object?> get props => [
        state,
        movieDetails,
        movieVideos,
      ];
}
