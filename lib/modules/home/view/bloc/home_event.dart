part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _HomeStarted;



  const factory HomeEvent.loadMovies({
    required MovieSection section,
    required Completer<Map<MovieSection, List<dynamic>>> result,
  }) = _LoadMovies;

  const factory HomeEvent.nextPageRequested({
    required MovieSection section,
    required Function success,
  }) = _NextPageRequested;

  const factory HomeEvent.switchSection({
    required MovieSection section,
  }) = _SwitchSection;

  const factory HomeEvent.searchMovies({
    required String query,
  }) = _SearchMovies;
}
