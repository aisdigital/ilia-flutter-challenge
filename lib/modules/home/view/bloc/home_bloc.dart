import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ilia_challenge/core/domain/services/uri_builder_service.dart';
import 'package:ilia_challenge/main.dart';
import 'package:ilia_challenge/modules/home/domain/home_repository.dart';
import 'package:ilia_challenge/modules/home/domain/movies_section.dart';

export 'package:ilia_challenge/modules/home/domain/movies_section.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository repo = injector.find<HomeRepository>();
  HomeBloc() : super(HomeState()) {
    on<HomeEvent>(
      (events, emit) async => events.map(
        started: (event) => _homeStarted(event, emit),
        pinSearchBar: (event) => _pinSearchBar(event, emit),
        loadMovies: (event) => _loadMovies(event, emit),
        nextPageRequested: (event) => _nextPageRequested(event, emit),
      ),
    );
  }

  _homeStarted(_HomeStarted event, emit) async {
    print(' ===================== HomeStarted ===================== ');
    Map<MovieSection, UriBuilderService> sections = _setSections();
    emit(state.copyWith(
        sections: sections, currentSection: MovieSection.nowPlaying));
    add(HomeEvent.loadMovies(section: state.currentSection!));
  }

  _pinSearchBar(_PinSearchBar event, emit) {}

  _loadMovies(_LoadMovies event, emit) async {
    UriBuilderService uriService = state.sections[event.section]!;

    var (error, response) = await repo.loadMovies(route: uriService.uri);

    if (error != null) {
      print('LoadMovies: ${event.section.path} | error: $error');
      return;
    }
    emit(state.copyWith(movies: List.from(response!.data['results'])));

    print('LoadMovies: ${event.section.path} | response: ${response}');
  }

  _nextPageRequested(_NextPageRequested event, emit) {
    state.sections[event.section]!.nextPage();
    add(HomeEvent.loadMovies(section: event.section));
  }

  Map<MovieSection, UriBuilderService> _setSections() {
    Map<MovieSection, UriBuilderService> sections = {};
    for (var element in MovieSection.values) {
      sections[element] = UriBuilderService(path: element.path);
    }
    return sections;
  }
}
