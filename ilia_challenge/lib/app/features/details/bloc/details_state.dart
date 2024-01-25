part of 'details_bloc.dart';

@immutable
abstract class DetailsState {}

abstract class DetailsActionState extends DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoadingState extends DetailsState {}

class DetailsErrorState extends DetailsState {}

class DetailsLoadedSuccessState extends DetailsState {
  final Movie movie;
  DetailsLoadedSuccessState({required this.movie});
}
