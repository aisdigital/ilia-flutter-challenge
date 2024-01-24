import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ilia_challenge/app/service/nowplaying_service.dart';
import 'package:ilia_challenge/app/service/popular_service.dart';
import 'package:ilia_challenge/app/service/trending_movies_service.dart';
import '../../../models/movie.dart';
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
        await Future.delayed(Duration(seconds: 1));
    try {
      final trendingMovies = await TrendingService().getTrendingMovies();
      final nowplayingMovies = await NowPlayingServoce().getnowPlayingMovies();
      final popularMovies = await PopularService().getPopularMovies();

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
