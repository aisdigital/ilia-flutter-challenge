import 'package:app/features/movie/list/movie_list_controller.dart';
import 'package:core/error/base_exception.dart';
import 'package:core/state/base_state.dart';
import 'package:service/movie/entities/movie_entity.dart';

class MovieListState extends BaseState<List<MovieEntity>> {
  final int currentPage;
  final bool hasMore;
  final bool pageLoading;
  final MovieListType listType;

  MovieListState({
    bool isLoading = false,
    BaseException? exception,
    List<MovieEntity>? movies,
    this.currentPage = 1,
    this.hasMore = true,
    this.pageLoading = false,
    this.listType = MovieListType.list,
  }) : super(
          isLoading: isLoading,
          exception: exception,
          data: movies,
        );

  @override
  MovieListState copyWith({
    bool? isLoading,
    List<MovieEntity>? data,
    BaseException? exception,
    int? currentPage,
    bool? hasMore,
    bool? pageLoading,
    MovieListType? listType,
  }) {
    return MovieListState(
      isLoading: isLoading ?? this.isLoading,
      movies: data ?? this.data,
      exception: exception ?? this.exception,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      pageLoading: pageLoading ?? this.pageLoading,
      listType: listType ?? this.listType,
    );
  }
}
