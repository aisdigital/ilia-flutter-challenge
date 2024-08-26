import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalog/core/common/entities/genre.dart';
import 'package:movie_catalog/core/use_case/use_case.dart';
import 'package:movie_catalog/features/movies_list/domain/entities/movie.dart';
import 'package:movie_catalog/features/movies_list/domain/use_cases/get_genres_use_case.dart';
import 'package:movie_catalog/features/movies_list/domain/use_cases/get_movies_use_case.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final GetMoviesUseCase getMoviesUseCase;
  final GetGenresUseCase getGenresUseCase;

  HomePageCubit(
    this.getMoviesUseCase,
    this.getGenresUseCase,
  ) : super(HomePageInitialState());

  int _page = 1;
  List<Movie> currentTheaterMovies = [];
  List<Genre> currentGenres = [];

  Future init() async {
    emit(HomePageLoadingState());
    final theaterMoviesResponse = await getMoviesUseCase.call(_page);
    final genres = await getGenresUseCase.call(NoParams());

    theaterMoviesResponse.fold(
      (l) => emit(HomePageInitialState()),
      (theaterMoviesResponseOnRight) {
        genres.fold(
          (l) => HomePageInitialState(),
          (genresOnRight) {
            currentTheaterMovies.addAll(theaterMoviesResponseOnRight.results);
            currentGenres.addAll(genresOnRight.where(
              (genresOnRightElement) => !currentGenres.contains(genresOnRightElement),
            ));
            emit(
              HomePageLoadedState(
                theaterMoviesResponse: currentTheaterMovies,
                genres: genresOnRight,
                isLoadingMoreMovies: false,
              ),
            );
          },
        );
      },
    );
  }

  Future fetchMoreMovies() async {
    emit(
      HomePageLoadedState(
        theaterMoviesResponse: currentTheaterMovies,
        isLoadingMoreMovies: true,
        genres: currentGenres,
      ),
    );

    _page++;

    final theaterMoviesResponse = await getMoviesUseCase.call(_page);

    theaterMoviesResponse.fold(
      (l) => emit(HomePageInitialState()),
      (r) async {
        currentTheaterMovies.addAll(r.results);

        await Future.delayed(const Duration(seconds: 2));
        emit(HomePageLoadedState(
          theaterMoviesResponse: currentTheaterMovies,
          isLoadingMoreMovies: false,
          genres: currentGenres,
        ));
      },
    );
  }
}
