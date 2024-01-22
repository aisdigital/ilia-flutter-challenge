import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/entities/movie_details.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/entities/movie_videos.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/usecases/fetch_movie_details/fetch_movie_details_usecase.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/usecases/fetch_movie_videos/fetch_movie_videos_usecase.dart';
import 'package:ilia_flutter_challenge/utils/app_urls.dart';
import 'package:url_launcher/url_launcher.dart';

part 'movie_details_state.dart';

class MovieDetailsStore extends Cubit<MovieDetailsState> {
  MovieDetailsStore(
    this.fetchMovieDetailsUsecase,
    this.fetchMovieVideosUsecase,
  ) : super(const MovieDetailsState());

  final FetchMovieDetailsUsecase fetchMovieDetailsUsecase;
  final FetchMovieVideosUsecase fetchMovieVideosUsecase;

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

  Future<void> fetchMovieVideos(int id) async {
    emit(state.copyWith(state: const LoadingMovieDetailsState()));

    final response = await fetchMovieVideosUsecase(id);

    response.fold(
      (success) => emit(
        state.copyWith(
          state: const SuccessMovieDetailsState(),
          movieVideos: success,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          state: const FailureMovieDetailsState(),
        ),
      ),
    );
  }

  Future<void> searchVideo({required String videoId}) async {
    try {
      final Uri url = Uri.parse(AppUrls.movieVideoUrl(videoId));
      if (!await launchUrl(url)) {
        throw Exception('Video not found!');
      }

      emit(
        state.copyWith(state: const SuccessMovieDetailsState()),
      );
    } catch (error) {
      emit(
        state.copyWith(
          state: const FailureMovieDetailsState(),
        ),
      );
    }
  }
}
