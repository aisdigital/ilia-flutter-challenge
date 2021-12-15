import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_db/domain/movie/movie.dart';
import 'package:movie_db/services/api/api_service.dart';

@injectable
class MoviePageController extends GetxController {
  MoviePageController({
    @factoryParam this.movie,
  });

  final Movie? movie;

  final _apiService = ApiService();

  final movieUpdated = Rxn<Movie>();

  @override
  void onInit() {
    super.onInit();
    _getMovieUpdated(movie!);
  }

  Future<String> getTrailerVideoKey(int id) async {
    return await _apiService.getTrailerVideoKey(id);
  }

  Future<void> _getMovieUpdated(Movie movie) async {
    final movieWithRunTime = await _apiService.getMovieRunTime(movie);
    movieUpdated.value = await _apiService.getMovieCast(movieWithRunTime);
  }
}
