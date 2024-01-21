import 'package:ilia_flutter_challenge/app/core/failures/general_failure.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/entities/movie_details.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:ilia_flutter_challenge/app/modules/movie_details/infra/datasources/movie_details_datasource.dart';
import 'package:result_dart/result_dart.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  MovieDetailsRepositoryImpl({required this.datasource});

  final MovieDetailsDatasource datasource;

  @override
  Future<Result<MovieDetails, GeneralFailure>> fetchMovieDetails(int id) async {
    try {
      final response = await datasource.fetchAllMovieDetails(id);
      return Success(response);
    } on GeneralFailure catch (error) {
      return Failure(error);
    }
  }
}
