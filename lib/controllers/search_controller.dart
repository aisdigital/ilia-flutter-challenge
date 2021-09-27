import 'package:ilia_flutter_challenge/data/repository.dart';
import 'package:ilia_flutter_challenge/domain/failure.dart';
import 'package:ilia_flutter_challenge/domain/movie.dart';
import 'package:ilia_flutter_challenge/domain/movie_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class SearchController extends GetxController with StateMixin {
  SearchController();

  final _repository = Repository();

  MovieResponseModel? movieResponseModel;
  IFailure? movieError;
  final showCancel = false.obs;

  List<Movie> get movies => movieResponseModel?.movies ?? <Movie>[];
  int get moviesCount => movies.length;
  bool get hasMovies => moviesCount != 0;
  int get totalPages => movieResponseModel?.totalPages ?? 1;
  int get currentPage => movieResponseModel?.page ?? 1;

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
  }

  void onFocusChange() {
    showCancel.value = !showCancel.value;
    if (showCancel.value) {
      change(null, status: RxStatus.empty());
    }
  }

  Future<Either<IFailure, MovieResponseModel>> searchMovie(
      String searchTerm) async {
    change(null, status: RxStatus.loading());

    final result = await _repository.searchMovie(searchTerm);
    result.fold(
      (error) => change(null, status: RxStatus.error(error.message)),
      (movie) {
        movieResponseModel = movie;
        change(null, status: RxStatus.success());
      },
    );

    return result;
  }
}
