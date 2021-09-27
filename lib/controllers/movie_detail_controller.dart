import 'package:dartz/dartz.dart';
import 'package:ilia_flutter_challenge/data/repository.dart';
import 'package:ilia_flutter_challenge/domain/failure.dart';
import 'package:get/get.dart';

import '../domain/movie_detail.dart';

class MovieDetailController extends GetxController with StateMixin {
  MovieDetailController(this.movieId);

  final int movieId;
  final _repository = Repository();

  final movieDetail = Rxn<MovieDetail>();

  bool loading = true;

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());

    fetchMovieById(movieId);
  }

  Future<Either<IFailure, MovieDetail>> fetchMovieById(int id) async {
    final result = await _repository.getMovie(id);
    result.fold(
      (error) => change(null, status: RxStatus.error(error.message)),
      (detail) {
        movieDetail.value = detail;

        change(null, status: RxStatus.success());
      },
    );
    return result;
  }
}
