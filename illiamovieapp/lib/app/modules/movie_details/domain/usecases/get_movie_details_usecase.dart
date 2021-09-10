import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/movie_details_entity.dart';
import '../repositories/i_movie_details_repository.dart';

class GetMovieDetailsUseCase
    implements UseCase<MovieDetails, ParamsGetMovieDetails> {
  final IMovieDetailsRepository _movieDetailsRepository;

  GetMovieDetailsUseCase({
    required IMovieDetailsRepository movieDetailsRepository,
  }) : _movieDetailsRepository = movieDetailsRepository;

  @override
  Future<Either<IFailure, MovieDetails>> call(params) async {
    return await _movieDetailsRepository.getMovieDetails(
      movieId: params.movieId,
    );
  }
}

class ParamsGetMovieDetails {
  final String movieId;

  ParamsGetMovieDetails({required this.movieId});
}
