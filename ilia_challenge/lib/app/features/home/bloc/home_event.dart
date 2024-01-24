part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeNavigateToDetailsEvent extends HomeEvent {
  final Movie clickedMovie;
  HomeNavigateToDetailsEvent({required this.clickedMovie});
}

class HomeInitialEvent extends HomeEvent {}
