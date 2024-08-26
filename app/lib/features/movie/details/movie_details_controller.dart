import 'package:app/features/movie/details/movie_details_state.dart';
import 'package:core/controller/base_controller.dart';
import 'package:core/core.dart';
import 'package:service/movie/repository/remote/details/details_repository.dart';
import 'package:service/movie/repository/remote/video/video_repository.dart';

class MovieDetailsController extends BaseController<MovieDetailsState> {
  final int id;

  final movieDetailsRepository = GetIt.instance<MovieDetailsRepository>();
  final movieVideoRepository = GetIt.instance<MovieVideoRepository>();

  MovieDetailsController({required int this.id}) : super(MovieDetailsState(isLoading: true, isLoadingVideos: true)) {
    fetchMovie();
    fetchVideos();
  }
  Future<void> fetchMovie() async {
    final result = await movieDetailsRepository.fetch(id: id);

    result.fold(
      (error) {
        update(state.copyWith(exception: error, isLoading: false));
      },
      (success) {
        update(
          state.copyWith(
            isLoading: false,
            data: success,
          ),
        );
      },
    );
  }

  Future<void> fetchVideos() async {
    final result = await movieVideoRepository.fetch(id: id);

    result.fold(
      (error) {
        update(state.copyWith(exception: error, isLoadingVideos: false));
      },
      (success) {
        update(
          state.copyWith(
            isLoadingVideos: false,
            videos: success,
          ),
        );
      },
    );
  }
}
