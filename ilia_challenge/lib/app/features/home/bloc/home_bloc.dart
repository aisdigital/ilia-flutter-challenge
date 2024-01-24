import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../../models/movie.dart';
import '../../../service/movies_service.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeNavigateToDetailsEvent>(homeNavigatetoDetailsEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    try {
      final trendingMovies = await Services().getTrendingMovies();
      final nowplayingMovies = await Services().getnowPlayingMovies();
      final popularMovies = await Services().getPopularMovies();

      emit(HomeLoadedSuccessState(
        trendingMovies: trendingMovies,
        nowplayingMovies: nowplayingMovies,
        popularMovies: popularMovies,
      ));
    } catch (e) {
      emit(HomeErrorState());
    }
  }

  FutureOr<void> homeNavigatetoDetailsEvent(
      HomeNavigateToDetailsEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigatetoDetailsState(clickedMovie: event.clickedMovie));
  }
}
