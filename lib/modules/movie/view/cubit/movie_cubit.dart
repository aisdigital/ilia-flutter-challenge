import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_challenge/core/domain/services/movies_uri_builder_service.dart';
import 'package:ilia_challenge/core/infra/services/models/movie_model.dart';
import 'package:ilia_challenge/main.dart';
import 'package:ilia_challenge/modules/home/view/bloc/home_bloc.dart';
import 'package:ilia_challenge/modules/movie/domain/movie_repository.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepository _repo = injector.find<MovieRepository>();

  MovieCubit() : super(MovieState(movie: Movie()));

  movieStarted(Movie movie) async {
    print(' ===================== movieStarted ===================== ');
    final uriService = MoviesUriBuilderService()
      ..setPath(
          path: MovieSection.details.path.replaceAll(':id?', '${movie.id}?'));

    final (error, response) =
        await _repo.movieDetails(route: uriService.uriDetails);
    if (response != null) {
      emit(state.copyWith(movie: movie));
    }
    print('error: ${error?.message} | response: ${response}');
  }
}
