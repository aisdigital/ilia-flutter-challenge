import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_db/domain/movie/movie.dart';
import 'package:movie_db/services/api/api_service.dart';

@injectable
class HomePageController extends GetxController {
  HomePageController();

  final _apiService = ApiService();

  final movieList = Rxn<List<Movie>>();
  final loadCount = RxInt(1);
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getNowPlaying();
  }

  void loadMore() async {
    try {
      loadCount.value = loadCount.value + 1;
      print('here: ' + loadCount.value.toString());
      isLoading(true);
      getNowPlaying();
    } finally {
      isLoading(false);
    }
  }

  Future<void> getNowPlaying() async {
    if (movieList.value != null) {
      movieList.value!
          .addAll(await _apiService.getNowPlayingOnPage(loadCount.value));
    } else {
      movieList.value = await _apiService.getNowPlayingOnPage(loadCount.value);
    }
  }
}
