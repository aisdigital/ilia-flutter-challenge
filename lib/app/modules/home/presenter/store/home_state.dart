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

class LoadingSearchMovieHomeState extends HomeStateIliaflix {
  const LoadingSearchMovieHomeState();

  @override
  List<Object?> get props => [];
}

class HomeState extends Equatable {
  final HomeStateIliaflix state;
  final NowPlayingMoviesSearchResult nowPlayingMovies;
  final String pageNumber;
  final int currentSearchPage;
  final bool pageCounterIsActive;
  final List<dynamic> findMoviesList;

  const HomeState({
    this.state = const InitialHomeState(),
    this.nowPlayingMovies = const NowPlayingMoviesSearchResult.empty(),
    this.pageNumber = '1',
    this.currentSearchPage = 1,
    this.pageCounterIsActive = true,
    this.findMoviesList = const [],
  });

  HomeState copyWith({
    HomeStateIliaflix? state,
    NowPlayingMoviesSearchResult? nowPlayingMovies,
    String? pageNumber,
    int? currentSearchPage,
    bool? pageCounterIsActive,
    List<dynamic>? findMoviesList,
  }) {
    return HomeState(
      state: state ?? this.state,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      pageNumber: pageNumber ?? this.pageNumber,
      currentSearchPage: currentSearchPage ?? this.currentSearchPage,
      pageCounterIsActive: pageCounterIsActive ?? this.pageCounterIsActive,
      findMoviesList: findMoviesList ?? this.findMoviesList,
    );
  }

  @override
  List<Object?> get props => [
        state,
        nowPlayingMovies,
        pageNumber,
        currentSearchPage,
        pageCounterIsActive,
        findMoviesList,
      ];
}
