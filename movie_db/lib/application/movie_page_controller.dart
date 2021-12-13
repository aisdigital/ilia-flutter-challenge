import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_db/domain/movie/movie.dart';
import 'package:movie_db/services/api/api_service.dart';

@injectable
class MoviePageController extends GetxController {
  MoviePageController();

  final _apiService = ApiService();

  final movies = Rxn<List<Movie>>();

  @override
  void onInit() {
    super.onInit();
    getNowPlaying();
  }

  Future<void> getNowPlaying() async {
    movies.value = await _apiService.getNowPlaying();
  }
}
