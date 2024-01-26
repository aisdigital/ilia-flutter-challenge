part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default(false) bool pinSearchBar,
    @Default({}) Map filters,
    @Default([]) List moovies,
  }) = _HomeState;
}
