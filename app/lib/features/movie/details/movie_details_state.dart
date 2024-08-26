import 'package:core/error/base_exception.dart';
import 'package:core/state/base_state.dart';
import 'package:service/movie/entities/movie_entity.dart';
import 'package:service/movie/entities/video_entity.dart';

class MovieDetailsState extends BaseState<MovieEntity> {
  final List<VideoEntity> videos;
  final bool isLoadingVideos;

  MovieDetailsState({
    bool isLoading = false,
    BaseException? exception,
    MovieEntity? movie,
    this.videos = const [],
    this.isLoadingVideos = false,
  }) : super(
          isLoading: isLoading,
          exception: exception,
          data: movie,
        );

  @override
  MovieDetailsState copyWith({
    bool? isLoading,
    MovieEntity? data,
    BaseException? exception,
    List<VideoEntity>? videos,
    bool? isLoadingVideos,
  }) {
    return MovieDetailsState(
      isLoading: isLoading ?? this.isLoading,
      movie: data ?? this.data,
      exception: exception ?? this.exception,
      videos: videos ?? this.videos,
      isLoadingVideos: isLoadingVideos ?? this.isLoadingVideos,
    );
  }
}
