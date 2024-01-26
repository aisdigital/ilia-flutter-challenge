import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ilia_challenge/main.dart';
import 'package:ilia_challenge/modules/home/domain/home_repository.dart';

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

    var (error, response) = await repo.discover();
    if (response != null) {
      emit(state.copyWith(moovies: List.from(response.data['results'])));
    }
    print('error: ${error?.message} | response: ${response}');
  }

  _pinSearchBar(_PinSearchBar event, emit) {}
  _loadMovies(_LoadMovies event, emit) {}
  _nextPageRequested(_NextPageRequested event, emit) {}
}
