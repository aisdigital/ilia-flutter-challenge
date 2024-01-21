import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/entities/movie_details.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/usecases/fetch_movie_details_usecase.dart';

part 'movie_details_state.dart';

class MovieDetailsStore extends Cubit<MovieDetailsState> {
  MovieDetailsStore(this.fetchMovieDetailsUsecase)
      : super(const MovieDetailsState());

  final FetchMovieDetailsUsecase fetchMovieDetailsUsecase;

  Future<void> fetchMovieDetails(int id) async {
    emit(state.copyWith(state: const LoadingMovieDetailsState()));

    final response = await fetchMovieDetailsUsecase(id);

    response.fold(
      (success) => emit(
        state.copyWith(
          state: const SuccessMovieDetailsState(),
          movieDetails: success,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          state: const FailureMovieDetailsState(),
        ),
      ),
    );
  }
}
