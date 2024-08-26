part of 'home_page_cubit.dart';

@immutable
sealed class HomePageState extends Equatable {}

final class HomePageInitialState extends HomePageState {
  @override
  List<Object?> get props => [];
}

final class HomePageLoadingState extends HomePageState {
  @override
  List<Object?> get props => [];
}

final class HomePageNewMoviesLoadingState extends HomePageState {
  @override
  List<Object?> get props => [];
}

final class HomePageLoadedState extends HomePageState {
  final List<Movie> theaterMoviesResponse;
  final bool isLoadingMoreMovies;
  final List<Genre> genres;

  HomePageLoadedState({
    required this.theaterMoviesResponse,
    required this.isLoadingMoreMovies,
    required this.genres,
  });

  @override
  List<Object?> get props => [
        theaterMoviesResponse,
        isLoadingMoreMovies,
        genres,
      ];
}
