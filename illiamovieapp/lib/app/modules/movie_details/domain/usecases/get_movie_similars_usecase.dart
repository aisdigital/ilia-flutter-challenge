import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/movie_similar_entity.dart';
import '../repositories/i_movie_details_repository.dart';

class GetMovieSimilarsUseCase
    implements UseCase<List<MovieSimilar>, ParamsGetMovieSimilar> {
  final IMovieDetailsRepository _movieDetailsRepository;

  GetMovieSimilarsUseCase({
    required IMovieDetailsRepository movieDetailsRepository,
  }) : _movieDetailsRepository = movieDetailsRepository;

  @override
  Future<Either<IFailure, List<MovieSimilar>>> call(params) async {
    return await _movieDetailsRepository.getMoviesSimilar(
      movieId: params.movieId,
    );
  }
}

class ParamsGetMovieSimilar {
  final String movieId;

  ParamsGetMovieSimilar({required this.movieId});
}
