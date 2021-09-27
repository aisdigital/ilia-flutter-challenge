import 'package:ilia_flutter_challenge/data/repository.dart';
import 'package:ilia_flutter_challenge/domain/movie_detail.dart';
import 'package:ilia_flutter_challenge/domain/movie_response_model.dart';
import 'package:ilia_flutter_challenge/domain/movie_video.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Repository tests',
    () {
      final _repository = Repository();
      test(
        'Should get all popular movies',
        () async {
          const _input = 2;
          final result = await _repository.getAllMovies(_input);
          expect(result.isRight(), true);
          expect(result.fold(id, id), isA<MovieResponseModel>());
        },
      );
      test(
        'Should get movie search',
        () async {
          final _repository = Repository();
          const _input = 'avengers';
          final result = await _repository.searchMovie(_input);
          expect(result.isRight(), true);
          expect(result.fold(id, id), isA<MovieResponseModel>());
        },
      );
      test(
        'Should get movie by id',
        () async {
          final _repository = Repository();
          const _input = 436969;
          final result = await _repository.getMovie(_input);
          expect(result.isRight(), true);
          expect(result.fold(id, id), isA<MovieDetail>());
        },
      );
      test(
        'Should get trailer',
        () async {
          final _repository = Repository();
          const _input = 2;
          final result = await _repository.getTrailer(_input);
          expect(result.isRight(), true);
          expect(result.fold(id, id), isA<MovieVideo>());
        },
      );
    },
  );
}
