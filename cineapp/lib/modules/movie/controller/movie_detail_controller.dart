import 'package:cineapp/error/movie_error.dart';
import 'package:cineapp/modules/movie/models/movie_detail.dart';
import 'package:cineapp/modules/movie/repository/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieDetailController {
  final _repository = MovieRepository();

  MovieDetailModel? movieDetail;
  MovieError? movieError;

  bool loading = true;

  Future<Either<MovieError, MovieDetailModel>> fetchMovieById(int id) async {
    movieError = null;
    final result = await _repository.fetchMovieDetail(id);
    result.fold(
      (error) => movieError = error,
      (detail) => movieDetail = detail,
    );
    return result;
  }
}
