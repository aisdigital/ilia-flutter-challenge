import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/movie_entity.dart';
import '../repositories/i_movies_repository.dart';

class GetMoviesInTheatreUseCase
    implements UseCase<List<Movie>, ParamsGetMoviesInTheatre> {
  final IMoviesRepository _moviesRepository;

  GetMoviesInTheatreUseCase({required IMoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  @override
  Future<Either<IFailure, List<Movie>>> call(params) async {
    return await _moviesRepository.getMoviesInTheatre(
      language: params.language,
      page: params.page,
    );
  }
}

class ParamsGetMoviesInTheatre {
  final String language;
  final int page;

  ParamsGetMoviesInTheatre({
    this.language = 'pt-BR',
    required this.page,
  });
}
