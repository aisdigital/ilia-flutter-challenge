import 'package:ilia_flutter_challenge/app/core/failures/general_failure.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/entities/movie_details.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/usecases/fetch_movie_details/fetch_movie_details_usecase.dart';
import 'package:result_dart/result_dart.dart';

class FetchMovieDetailsUsecaseImpl implements FetchMovieDetailsUsecase {
  FetchMovieDetailsUsecaseImpl({required this.repository});

  final MovieDetailsRepository repository;

  @override
  Future<Result<MovieDetails, GeneralFailure>> call(int id) async {
    final response = await repository.fetchMovieDetails(id);
    return response;
  }
}
