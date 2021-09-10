import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/movie_video_entity.dart';
import '../repositories/i_movie_details_repository.dart';

class GetMovieVideoUseCase
    implements UseCase<List<MovieVideo>, ParamsGetMovieVideo> {
  final IMovieDetailsRepository _movieDetailsRepository;

  GetMovieVideoUseCase({
    required IMovieDetailsRepository movieDetailsRepository,
  }) : _movieDetailsRepository = movieDetailsRepository;

  @override
  Future<Either<IFailure, List<MovieVideo>>> call(params) async {
    return await _movieDetailsRepository.getMovieVideo(
      movieId: params.movieId,
    );
  }
}

class ParamsGetMovieVideo {
  final String movieId;

  ParamsGetMovieVideo({required this.movieId});
}
