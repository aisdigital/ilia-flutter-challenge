import 'package:cineapp/core/api.dart';
import 'package:cineapp/error/error_repository.dart';
import 'package:cineapp/error/movie_error.dart';
import 'package:cineapp/modules/movie/models/movie_detail.dart';
import 'package:cineapp/modules/movie/models/movie_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  final Dio _dio = Dio(dioOptions);

  Future<Either<MovieError, MovieResponseModel>?> fetchPopularMovies(
      int page) async {
    try {
      final response = await _dio.get('/movie/popular?page=$page');
      final model = MovieResponseModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(
          MovieErrorRepository(error.response?.data['status_message']),
        );
      } else {
        Left(MovieErrorRepository(serverError));
      }
    } on Exception catch (error) {
      return Left(MovieErrorRepository(error.toString()));
    }
  }

  Future<Either<MovieError, MovieDetailModel>> fetchMovieDetail(int id) async {
    try {
      final response = await _dio.get('/movie/$id');
      final model = MovieDetailModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(
          MovieErrorRepository(error.response?.data['status_message']),
        );
      } else {
        return Left(MovieErrorRepository(serverError));
      }
    } on Exception catch (error) {
      return Left(MovieErrorRepository(error.toString()));
    }
  }
}
