part of 'movie_details_page_cubit.dart';

@immutable
sealed class MovieDetailsPageState extends Equatable {}

class MovieDetailsPageInitialState extends MovieDetailsPageState {
  @override
  List<Object?> get props => [];
}

class MovieDetailsPageLoadingState extends MovieDetailsPageState {
  @override
  List<Object?> get props => [];
}

class MovieDetailsPageLoadedState extends MovieDetailsPageState {
  final MovieDetails movieDetails;
  final MovieVideosResponse movieVideosResponse;

  MovieDetailsPageLoadedState({
    required this.movieDetails,
    required this.movieVideosResponse,
  });

  @override
  List<Object> get props => [movieDetails, movieVideosResponse];
}
