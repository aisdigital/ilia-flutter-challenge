import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/movie_similar_entity.dart';
import '../../domain/entities/movie_video_entity.dart';
import '../../domain/repositories/i_movie_details_repository.dart';
import '../datasources/i_movie_details_remote_datasource.dart';
import '../models/movie_similar_model.dart';
import '../models/movie_video_model.dart';

class MovieDetailsRepository implements IMovieDetailsRepository {
  final IMovieDetailsRemoteDatasource _movieDetailsRemoteDataSource;
  final INetworkInfo _networkInfo;

  MovieDetailsRepository({
    required INetworkInfo networkInfo,
    required IMovieDetailsRemoteDatasource movieDetailsRemoteDatasource,
  })  : _movieDetailsRemoteDataSource = movieDetailsRemoteDatasource,
        _networkInfo = networkInfo;

  @override
  Future<Either<IFailure, MovieDetails>> getMovieDetails({
    required String movieId,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final movieDetails =
            await _movieDetailsRemoteDataSource.getMovieDetails(
          movieId: movieId,
        );

        return Right(movieDetails.toEntity());
      } on ServerException catch (e) {
        return Left(
          ServerFailure(message: e.message),
        );
      }
    } else {
      return Left(InternetConectionFailure());
    }
  }

  @override
  Future<Either<IFailure, List<MovieVideo>>> getMovieVideo({
    required String movieId,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final List<MovieVideoModel> moviesVideoModel =
            await _movieDetailsRemoteDataSource.getMovieVideo(
          movieId: movieId,
        );

        final List<MovieVideo> moviesVideo = List<MovieVideo>.from(
          moviesVideoModel.map(
            (e) => e.toEntity(),
          ),
        );

        return Right(moviesVideo);
      } on ServerException catch (e) {
        return Left(
          ServerFailure(message: e.message),
        );
      }
    } else {
      return Left(InternetConectionFailure());
    }
  }

  @override
  Future<Either<IFailure, List<MovieSimilar>>> getMoviesSimilar({
    required String movieId,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final List<MovieSimilarModel> moviesSimilarModel =
            await _movieDetailsRemoteDataSource.getMoviesSimilar(
          movieId: movieId,
        );

        final List<MovieSimilar> moviesSimilar = List<MovieSimilar>.from(
          moviesSimilarModel.map(
            (e) => e.toEntity(),
          ),
        );

        return Right(moviesSimilar);
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
