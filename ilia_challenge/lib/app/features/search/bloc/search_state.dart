part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

abstract class SearchActionState extends SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedSuccessState extends SearchState {
  final List<Movie> movies;

  SearchLoadedSuccessState({
    required this.movies,
  });
}

class SearchedMovieState extends SearchState {
  final List<Movie> movies;

  SearchedMovieState({
    required this.movies,
  });
}

class SearchLoadedMoreMoviesSuccessState extends SearchState {
  final List<Movie> movies;

  SearchLoadedMoreMoviesSuccessState({
    required this.movies,
  });
}

class SearchErrorState extends SearchState {}
