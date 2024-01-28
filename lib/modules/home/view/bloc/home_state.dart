part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default({}) Map filters,
    @Default({}) Map<MovieSection, List> movies,
    @Default({}) Map<MovieSection, MoviesUriBuilderService> sections,
    @Default(MovieSection.nowPlaying) MovieSection currentSection,
    @Default({}) Map<String, bool> loaders,
  }) = _HomeState;
}
