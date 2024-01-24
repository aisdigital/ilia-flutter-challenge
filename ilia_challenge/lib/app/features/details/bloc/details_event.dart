part of 'details_bloc.dart';

@immutable
abstract class DetailsEvent {}

class DetailsLoadMovieEvent extends DetailsEvent {
  final Movie clickedMovie;
  DetailsLoadMovieEvent({required this.clickedMovie});
}

