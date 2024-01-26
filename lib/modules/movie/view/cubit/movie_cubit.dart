import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilia_challenge/main.dart';
import 'package:ilia_challenge/modules/movie/domain/movie_repository.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final _repo = injector.find<MovieRepository>();

  MovieCubit() : super(const MovieState());

  movieStarted(Map movie) async {
    print(' ===================== movieStarted ===================== ');
    final (error, response) = await _repo.movieDetails();
    if (response != null) {
      emit(state.copyWith(movie: movie));
    }
    print('error: ${error?.message} | response: ${response}');
  }
}
