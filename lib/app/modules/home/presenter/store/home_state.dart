part of 'home_store.dart';

abstract class HomeStateIliaflix extends Equatable {
  const HomeStateIliaflix();
}

class InitialHomeState extends HomeStateIliaflix {
  const InitialHomeState();

  @override
  List<Object?> get props => [];
}

class LoadingHomeState extends HomeStateIliaflix {
  const LoadingHomeState();

  @override
  List<Object?> get props => [];
}

class SuccessHomeState extends HomeStateIliaflix {
  const SuccessHomeState();

  @override
  List<Object?> get props => [];
}

class FailureHomeState extends HomeStateIliaflix {
  const FailureHomeState();

  @override
  List<Object?> get props => [];
}

class SuccessSearchMovieHomeState extends HomeStateIliaflix {
  const SuccessSearchMovieHomeState();

  @override
  List<Object?> get props => [];
}

class HomeState extends Equatable {
  final HomeStateIliaflix state;
  final NowPlayingMoviesSearchResult nowPlayingMovies;
  final String pageNumber;
  final dynamic findMovie;

  const HomeState({
    this.state = const InitialHomeState(),
    this.nowPlayingMovies = const NowPlayingMoviesSearchResult.empty(),
    this.pageNumber = '1',
    this.findMovie,
  });

  HomeState copyWith({
    HomeStateIliaflix? state,
    NowPlayingMoviesSearchResult? nowPlayingMovies,
    String? pageNumber,
    dynamic findMovie,
  }) {
    return HomeState(
      state: state ?? this.state,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      pageNumber: pageNumber ?? this.pageNumber,
      findMovie: findMovie ?? this.findMovie,
    );
  }

  @override
  List<Object?> get props => [
        state,
        nowPlayingMovies,
        pageNumber,
        findMovie,
      ];
}
