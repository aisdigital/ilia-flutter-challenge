import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_catalog/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_catalog/features/movie_details/domain/entities/movie_videos_response.dart';
import 'package:movie_catalog/features/movie_details/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_catalog/features/movie_details/domain/use_cases/get_movie_videos_response_use_case.dart';

part 'movie_details_page_state.dart';

class MovieDetailsPageCubit extends Cubit<MovieDetailsPageState> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  GetMovieVideosResponseUseCase getMovieVideosResponseUseCase;

  MovieDetailsPageCubit(
    this.getMovieDetailsUseCase,
    this.getMovieVideosResponseUseCase,
  ) : super(MovieDetailsPageInitialState());

  Future init(int id) async {
    emit(MovieDetailsPageLoadingState());

    final movieDetails = await getMovieDetailsUseCase.call(id);
    final movieVideosResponse = await getMovieVideosResponseUseCase.call(id);

    movieDetails.fold(
      (l) => emit(MovieDetailsPageInitialState()),
      (movieDetailsOnRight) => movieVideosResponse.fold(
        (l) => emit(MovieDetailsPageInitialState()),
        (movieVideosOnRight) => emit(
          MovieDetailsPageLoadedState(
            movieDetails: movieDetailsOnRight,
            movieVideosResponse: movieVideosOnRight,
          ),
        ),
      ),
    );
  }
}
