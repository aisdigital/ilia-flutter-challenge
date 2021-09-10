import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/i_movies_repository.dart';
import '../datasources/i_movies_remote_datasource.dart';
import '../models/movie_model.dart';

class MoviesRepository implements IMoviesRepository {
  final IMoviesRemoteDatasource _moviesRemoteDatasource;
  final INetworkInfo _networkInfo;

  MoviesRepository({
    required IMoviesRemoteDatasource moviesRemoteDatasource,
    required INetworkInfo networkInfo,
  })  : _moviesRemoteDatasource = moviesRemoteDatasource,
        _networkInfo = networkInfo;

  @override
  Future<Either<IFailure, List<Movie>>> getMoviesInTheatre({
    required String language,
    required int page,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final List<MovieModel> moviesModel =
            await _moviesRemoteDatasource.getMoviesInTheatre(
          language: language,
          page: page,
        );

        final List<Movie> movies = List<Movie>.from(
          moviesModel.map(
            (e) => e.toEntity(),
          ),
        );

        return Right(movies);
      } on ServerException catch (e) {
        return Left(
          ServerFailure(message: e.message),
        );
      }
    } else {
      return Left(InternetConectionFailure());
    }
  }
}
