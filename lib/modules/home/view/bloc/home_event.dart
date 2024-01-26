part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _HomeStarted;

  const factory HomeEvent.pinSearchBar({required bool pinSearchBar}) =
      _PinSearchBar;

  const factory HomeEvent.loadMovies(
      {required Map<String, dynamic> filters,
      required Function success}) = _LoadMovies;

  const factory HomeEvent.nextPageRequested({required Function success}) =
      _NextPageRequested;
}
