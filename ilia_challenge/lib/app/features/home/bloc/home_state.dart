part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<Movie> trendingMovies;
  final List<Movie> nowplayingMovies;
  final List<Movie> popularMovies;

  HomeLoadedSuccessState({
    required this.trendingMovies,
    required this.nowplayingMovies,
    required this.popularMovies,
  });
}

class HomeErrorState extends HomeState {}

class HomeNavigatetoDetailsState extends HomeActionState {
  final Movie clickedMovie;
  HomeNavigatetoDetailsState({required this.clickedMovie});
}
