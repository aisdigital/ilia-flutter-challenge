import 'package:ilia_flutter_challenge/data/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:ilia_flutter_challenge/domain/failure.dart';
import 'package:get/get.dart';

import '../domain/movie.dart';
import '../domain/movie_response_model.dart';

class HomeController extends GetxController with StateMixin {
  final _repository = Repository();

  final movieResponseModel = Rxn<MovieResponseModel>();
  final lastPage = 1.obs;

  List<Movie> get movies => movieResponseModel.value?.movies ?? <Movie>[];
  int get moviesCount => movies.length;
  bool get hasMovies => moviesCount != 0;
  int get totalPages => movieResponseModel.value?.totalPages ?? 1;
  int get currentPage => movieResponseModel.value?.page ?? 1;

  initController() async {
    change(null, status: RxStatus.loading());
    await getAllMovies(lastPage.value);
  }

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());

    getAllMovies(currentPage);
  }

  Future<Either<IFailure, MovieResponseModel>> getAllMovies(
      [int page = 1]) async {
    change(null, status: RxStatus.loading());
    final result = await _repository.getAllMovies(page);
    result.fold(
      (error) {
        change(null, status: RxStatus.error(error.message));
      },
      (movie) {
        if (movieResponseModel.value == null) {
          movieResponseModel.value = movie;
        } else {
          movieResponseModel.value?.page = movie.page;
          movieResponseModel.value?.movies?.addAll(movie.movies!);
        }
        change(null, status: RxStatus.success());
      },
    );

    return result;
  }
}
