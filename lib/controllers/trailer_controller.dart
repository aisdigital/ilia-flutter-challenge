import 'package:ilia_flutter_challenge/data/repository.dart';
import 'package:ilia_flutter_challenge/domain/movie_video.dart';
import 'package:get/get.dart';

class TrailerController extends GetxController with StateMixin {
  TrailerController(
    this.movieId,
  );
  final int movieId;
  final _repository = Repository();

  final videoUrl = Rxn<String>();
  final videoModel = Rxn<MovieVideo>();

  String? get trailerUrl => videoModel.value?.results.first.key;

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    getTrailer(movieId);
    super.onInit();
  }

  Future<void> getTrailer(int id) async {
    final result = await _repository.getTrailer(id);
    result.fold(
      (error) {
        change(null, status: RxStatus.error());
      },
      (videoResponse) {
        change(null, status: RxStatus.success());
        videoModel.value = videoResponse;
      },
    );
    change(null, status: RxStatus.success());
  }
}
