import 'package:fpdart/fpdart.dart';
import 'package:movie_catalog/core/error/failure.dart';
import 'package:movie_catalog/core/use_case/use_case.dart';
import 'package:movie_catalog/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_catalog/features/movie_details/domain/repositories/movie_details_repository.dart';

class GetMovieDetailsUseCase implements UseCase {
  final MovieDetailsRepository movieDetailsRepository;

  const GetMovieDetailsUseCase(
    this.movieDetailsRepository,
  );

  @override
  Future<Either<Failure, MovieDetails>> call(id) async {
    final movieDetails = await movieDetailsRepository.getMovieDetails(id: id);

    return movieDetails;
  }
}
